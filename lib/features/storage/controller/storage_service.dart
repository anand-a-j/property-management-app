import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart';

import '../../../core/api/data_response.dart';
import '../../../core/enum/image_upload_type.dart';
import '../../../core/utils/error_log.dart';
import '../model/storage_result.dart';

class StorageService {
  final SupabaseClient _client = Supabase.instance.client;
  final String bucket = 'store-assets';

  /// ✅ UPLOAD IMAGE
  Future<DataResponse<StorageResult>> uploadImage({
    required File file,
    required String userId,
    required String storeId,
    required ImageUploadType type,
  }) async {
    try {
      final fileName =
          "${DateTime.now().millisecondsSinceEpoch}_${basename(file.path)}";

      final filePath = "user_$userId/store_$storeId/${type.folder}/$fileName";

      print("AUTH UID: ${Supabase.instance.client.auth.currentUser?.id}");
      print("USER ID PARAM: $userId");
      print("FILE PATH: ${filePath}");

      await _client.storage
          .from(bucket)
          .upload(
            filePath,
            file,
            fileOptions: const FileOptions(
              upsert: true,
              cacheControl: '3600', // ✅ reduces repeated downloads
            ),
          );

      final publicUrl = _client.storage.from(bucket).getPublicUrl(filePath);

      return DataResponse(
        data: StorageResult(url: publicUrl, path: filePath),
      );
    } catch (e, stack) {
      errorlog("Upload error", e, stack);
      return DataResponse(error: "Failed to upload image");
    }
  }

  /// ✅ DELETE SINGLE IMAGE
  Future<DataResponse<bool>> deleteImage(String? path) async {
    try {
      if (path == null || path.isEmpty) {
        return DataResponse(data: true);
      }

      await _client.storage.from(bucket).remove([path]);

      return DataResponse(data: true);
    } catch (e, stack) {
      errorlog("Delete image error", e, stack);
      return DataResponse(error: "Failed to delete image");
    }
  }

  /// ✅ DELETE MULTIPLE IMAGES
  Future<DataResponse<bool>> deleteImages(List<String> paths) async {
    try {
      if (paths.isEmpty) return DataResponse(data: true);

      await _client.storage.from(bucket).remove(paths);

      return DataResponse(data: true);
    } catch (e, stack) {
      errorlog("Delete multiple images error", e, stack);
      return DataResponse(error: "Failed to delete images");
    }
  }

  /// ✅ REPLACE IMAGE (VERY IMPORTANT)
  Future<DataResponse<StorageResult>> replaceImage({
    required File newFile,
    required String? oldPath,
    required String userId,
    required String storeId,
    required ImageUploadType type,
  }) async {
    try {
      // 1. Upload new image first (safe)
      final uploadRes = await uploadImage(
        file: newFile,
        userId: userId,
        storeId: storeId,
        type: type,
      );

      if (uploadRes.hasError || uploadRes.data == null) {
        return DataResponse(error: uploadRes.error);
      }

      // 2. Delete old image (non-blocking logic)
      if (oldPath != null && oldPath.isNotEmpty) {
        await deleteImage(oldPath);
      }

      return DataResponse(data: uploadRes.data);
    } catch (e, stack) {
      errorlog("Replace image error", e, stack);
      return DataResponse(error: "Failed to replace image");
    }
  }
}
