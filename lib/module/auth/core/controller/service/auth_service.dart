import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/enum/user_role.dart';
import '../../model/profile.dart';
import '../db/profile_db.dart';
import '../repo/auth_repo.dart';

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

  Future<void> initialize() async {
    if (_initialized) return;

    // No active Supabase session
    if (!isAuthenticated) {
      _profile = null;
      _initialized = true;
      return;
    }

    // Load cached profile first
    _profile = _profileDB.getProfile();

    // Get latest profile from Supabase
    await refreshProfile();

    _initialized = true;
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
  }) async {
    final response = await _authRepo.signUp(
      email: email,
      password: password,
      name: name,
      phone: phone,
      role: role,
    );

    if (response.error != null) {
      return response;
    }

    await refreshProfile();

    return DataResponse(data: null);
  }

  // ---------------------------------------------------------------------------
  // SIGN IN
  // ---------------------------------------------------------------------------

  Future<DataResponse<void>> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _authRepo.signIn(email: email, password: password);

    if (response.error != null) {
      return response;
    }

    await refreshProfile();

    return DataResponse(data: null);
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
      final profile = Profile.fromJson(response.data!);

      // Update memory
      _profile = profile;

      // Update Hive
      await _profileDB.saveProfile(profile);

      return DataResponse(data: profile);
    } catch (e) {
      return DataResponse(error: 'Failed to parse profile');
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
