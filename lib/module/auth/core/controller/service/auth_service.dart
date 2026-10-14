import 'dart:developer';

import 'package:naseem/core/enum/sign_up_type.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/enum/user_role.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/profile.dart';
import '../../model/profile_details.dart';
import '../db/profile_db.dart';
import '../repo/auth_repo.dart';
import '../repo/profile_repo.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final AuthRepo _authRepo = AuthRepo();
  final ProfileDB _profileDB = ProfileDB();

  Profile? _profile;

  bool _initialized = false;

  // ---------------------------------------------------------------------------
  // GETTERS
  // ---------------------------------------------------------------------------

  /// Current cached profile
  Profile? get profile => _profile;

  /// Supabase authenticated user
  User? get user => _authRepo.getCurrentUser();

  /// Current Supabase session
  Session? get session => _authRepo.getCurrentSession();

  /// Whether user is authenticated
  bool get isAuthenticated => _authRepo.isLoggedIn();

  /// Whether AuthService has finished initialization
  bool get isInitialized => _initialized;

  /// Current user role
  UserRole? get role => _profile?.role;

  /// Current user ID
  String? get userId => _profile?.id;

  /// Current user name
  String? get name => _profile?.name;

  /// Current user email
  String? get email => _profile?.email;

  /// Current user phone
  String? get phone => _profile?.phone;

  // ---------------------------------------------------------------------------
  // INITIALIZE
  // ---------------------------------------------------------------------------

  Future<bool> initialize() async {
    if (_initialized) {
      return isAuthenticated && _profile != null;
    }

    try {
      // No active Supabase session.
      if (!isAuthenticated) {
        _profile = null;
        await _profileDB.deleteProfile();

        _initialized = true;
        return false;
      }

      // Load the cached profile before making a network request.
      _profile = _profileDB.getProfile();
      final cachedProfile = _profile;

      // Try to load the latest profile, including resident details.
      final response = await refreshProfile();

      if (response.data != null) {
        _profile = response.data;
        _initialized = true;
        return true;
      }

      // Refresh failed, but a cached profile exists.
      if (cachedProfile != null && isAuthenticated) {
        _profile = cachedProfile;
        _initialized = true;
        return true;
      }

      // No cached profile is available.
      _initialized = false;

      throw Exception(response.error ?? 'Unable to initialize authentication.');
    } catch (e) {
      // Preserve the cached profile if the session is still present.
      if (_profile != null && isAuthenticated) {
        _initialized = true;
        return true;
      }

      _initialized = false;
      rethrow;
    }
  }

  Future<DataResponse<void>> createManagedUser({
    required String email,
    required String password,
    required String name,
    String? phone,
    required UserRole role,
  }) async {
    try {
      log("email : $email , role : ${role.value}");

      final SupabaseClient client = Supabase.instance.client;
      await client.functions.invoke(
        'create-managed-user',
        body: {
          'email': email.trim(),
          'password': password,
          'name': name.trim(),
          'phone': phone?.trim(),
          'role': role.value,
        },
      );

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('AuthRepo.createManagedUser', e, stack),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // SIGN UP
  // ---------------------------------------------------------------------------

  Future<DataResponse<void>> signUp({
    required String email,
    required String password,
    required String name,
    String? phone,
    required UserRole role,
    required SignUpType signUpType,
    required bool isManagedCreation,
    String? orgId,
    ProfileDetails? profileDetails,
  }) async {
    if (isManagedCreation) {
      // Managed accounts must never use auth.signUp().
      if (role == UserRole.platformAdmin || orgId == null || orgId.isEmpty) {
        return DataResponse(
          error: 'Invalid role or organization for account creation.',
        );
      }

      return createManagedUser(
        email: email,
        password: password,
        name: name,
        phone: phone,
        role: role,
      );
    }

    // Self-signup only.
    final response = await _authRepo.signUp(
      email: email,
      password: password,
      name: name,
      phone: phone,
      role: role,
      orgId: orgId,
      profileDetails: profileDetails,
    );

    if (response.error != null) {
      return response;
    }

    // Only self-signup should load the newly authenticated user's profile.
    if (role != UserRole.platformAdmin) {
      final profileResponse = await refreshProfile();

      if (profileResponse.error != null) {
        return DataResponse(error: profileResponse.error);
      }
    }

    return DataResponse(data: null);
  }

  // ---------------------------------------------------------------------------
  // SIGN IN
  // ---------------------------------------------------------------------------

  Future<DataResponse<Profile>> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _authRepo.signIn(email: email, password: password);

    if (response.hasError) {
      return DataResponse(error: response.error);
    }

    final profileResponse = await refreshProfile();

    if (profileResponse.hasData) {
      return DataResponse(data: profileResponse.data!);
    }

    return DataResponse(
      error: profileResponse.error ?? 'Unable to load profile',
    );
  }

  // ---------------------------------------------------------------------------
  // REFRESH PROFILE
  // ---------------------------------------------------------------------------

  Future<DataResponse<Profile>> refreshProfile() async {
    final response = await _authRepo.getCurrentProfile();

    if (response.error != null) {
      return DataResponse(error: response.error);
    }

    if (response.data == null) {
      return DataResponse(error: 'Profile not found');
    }

    try {
      log('response data: ${response.data}');

      var profile = Profile.fromJson(response.data!);

      // Fetch additional details for residents only
      if (profile.role == UserRole.resident) {
        final detailsResponse = await ProfileRepo().getProfileDetails(
          profileId: profile.id,
        );

        if (detailsResponse.error != null) {
          return DataResponse(error: detailsResponse.error);
        }

        final profileDetails = detailsResponse.data;

        profile = profile.copyWith(profileDetails: profileDetails);
      }

      // Update memory
      _profile = profile;

      // Update Hive
      await _profileDB.saveProfile(profile);

      return DataResponse(data: profile);
    } catch (e, s) {
      log('refreshProfile error: $e $s');
      return DataResponse(error: 'Failed to refresh profile');
    }
  }

  // ---------------------------------------------------------------------------
  // UPDATE PROFILE
  // ---------------------------------------------------------------------------

  Future<DataResponse<void>> updateProfile({
    required String name,
    String? phone,
  }) async {
    final response = await _authRepo.updateProfile(name: name, phone: phone);

    if (response.error != null) {
      return response;
    }

    // Supabase → Memory → Hive
    await refreshProfile();

    return DataResponse(data: null);
  }

  // ---------------------------------------------------------------------------
  // SIGN OUT
  // ---------------------------------------------------------------------------

  Future<DataResponse<void>> signOut() async {
    final response = await _authRepo.signOut();

    if (response.error != null) {
      return response;
    }

    // Clear memory
    _profile = null;

    // Clear local cache
    await _profileDB.deleteProfile();

    return DataResponse(data: null);
  }

  // ---------------------------------------------------------------------------
  // DELETE ACCOUNT
  // ---------------------------------------------------------------------------

  Future<DataResponse<bool>> deleteAccount() async {
    final response = await _authRepo.deleteAccount();

    if (response.error != null) {
      return response;
    }

    _profile = null;

    await _profileDB.deleteProfile();

    return DataResponse(data: true);
  }

  // ---------------------------------------------------------------------------
  // CLEAR AUTH DATA
  // ---------------------------------------------------------------------------

  Future<void> clear() async {
    _profile = null;

    await _profileDB.deleteProfile();
  }
}

final authentication = AuthService.instance;
