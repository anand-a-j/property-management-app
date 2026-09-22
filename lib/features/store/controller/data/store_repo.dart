import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/utils/error_log.dart';
import '../../model/store.dart';

class StoreRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<Store?>> getMyStore() async {
    const fn = "StoreRepo.getMyStore";

    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        return DataResponse(error: "User not logged in");
      }

      final response = await _client
          .from('stores')
          .select()
          .eq('user_id', user.id)
          .maybeSingle();

      if (response == null) {
        return DataResponse(data: null); // user has no store yet
      }

      return DataResponse(data: Store.fromJson(response));
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  /// CREATE STORE WITH IMAGE
Future<DataResponse<Store>> createStore({
    required String name,
    required String slug,
    required String whatsapp,
    required String primaryColor,
    required String? description,
    required String? logoUrl,
    required String? logoPath, // ✅ added
  }) async {
    const fn = "StoreRepo.createStore";

    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        return DataResponse(error: "User not logged in");
      }

      final existing = await _client
          .from('stores')
          .select('id')
          .eq('user_id', user.id)
          .maybeSingle();

      if (existing != null) {
        return DataResponse(error: "Store already exists for this user");
      }

      final payload = {
        'user_id': user.id,
        'name': name.trim(),
        'store_slug': slug.trim().toLowerCase(),
        'whatsapp_number': whatsapp.trim(),
        'description': description?.trim(),
        'logo_url': logoUrl,
        'logo_path': logoPath, // ✅ FIX
        'primary_color': primaryColor,
      };

      final response = await _client
          .from('stores')
          .insert(payload)
          .select()
          .single();

      return DataResponse(data: Store.fromJson(response));
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  Future<DataResponse<Store>> updateStore({
    required String storeId,
    required String? name,
    required String? whatsapp,
    required String? primaryColor,
    required String? description,
    required String? logoUrl,
    required String? logoPath,
  }) async {
    const fn = "StoreRepo.updateStore";

    try {
      final updates = <String, dynamic>{};

      if (name != null) updates['name'] = name.trim();
      if (whatsapp != null) updates['whatsapp_number'] = whatsapp.trim();
      if (primaryColor != null) updates['primary_color'] = primaryColor;
      if (description != null) updates['description'] = description.trim();

      if (logoUrl != null) updates['logo_url'] = logoUrl;
      if (logoPath != null) updates['logo_path'] = logoPath; // ✅ FIX

      if (updates.isEmpty) {
        return DataResponse(error: "No fields to update");
      }

      final response = await _client
          .from('stores')
          .update(updates)
          .eq('id', storeId)
          .select()
          .single();

      return DataResponse(data: Store.fromJson(response));
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  /// CHECK SLUG AVAILABILITY
  Future<DataResponse<bool>> isSlugAvailable(String slug) async {
    const fn = "StoreRepo.isSlugAvailable";

    try {
      final response = await _client
          .from('stores')
          .select('id')
          .eq('store_slug', slug)
          .maybeSingle();

      // true = available
      return DataResponse(data: response == null);
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  Future<DataResponse<Store>> updateStoreSlug({
    required String storeId,
    required String newSlug,
  }) async {
    const fn = "StoreRepo.updateStoreSlug";

    try {
      final slug = newSlug.trim().toLowerCase();

      // ✅ Check availability
      final existing = await _client
          .from('stores')
          .select('id')
          .eq('store_slug', slug)
          .maybeSingle();

      if (existing != null) {
        return DataResponse(error: "Slug already taken");
      }

      final response = await _client
          .from('stores')
          .update({'store_slug': slug})
          .eq('id', storeId)
          .select()
          .single();

      return DataResponse(data: Store.fromJson(response));
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }
}
