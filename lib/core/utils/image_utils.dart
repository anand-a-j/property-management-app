import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static const int maxLogoSizeBytes = 50 * 1024; // 50 KB
  static const int maxProductImageSizeBytes = 75 * 1024; // 75 KB

  /// 📸 PICK STORE LOGO
  static Future<File> pickStoreLogo({required ImageSource source}) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source, imageQuality: 90);

    if (pickedFile == null) {
      throw Exception("No image selected");
    }

    final file = File(pickedFile.path);

    final compressed = await _compressSmart(
      file,
      targetSize: maxLogoSizeBytes,
      minWidth: 512,
      minHeight: 512,
      prefix: "logo",
    );

    if (compressed == null) {
      throw Exception("Failed to process image");
    }

    return compressed;
  }

  /// 📸 PICK PRODUCT IMAGE
  static Future<File> pickProductImage({required ImageSource source}) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source, imageQuality: 90);

    if (pickedFile == null) {
      throw Exception("No image selected");
    }

    final file = File(pickedFile.path);

    final compressed = await _compressSmart(
      file,
      targetSize: maxProductImageSizeBytes,
      minWidth: 600, // 👈 more aggressive than logo
      minHeight: 600,
      prefix: "product",
    );

    if (compressed == null) {
      throw Exception("Failed to process image");
    }

    final size = await compressed.length();

    if (size > maxProductImageSizeBytes) {
      throw Exception("Image must be less than 75 KB");
    }

    return compressed;
  }

  /// 🧠 UNIVERSAL SMART COMPRESSION
  static Future<File?> _compressSmart(
    File file, {
    required int targetSize,
    required int minWidth,
    required int minHeight,
    required String prefix,
  }) async {
    try {
      const int minQuality = 30;
      int quality = 90;

      File? compressedFile;

      final basePath =
          "${file.parent.path}/${prefix}_${DateTime.now().millisecondsSinceEpoch}";

      do {
        final targetPath = "$basePath.jpg";

        final result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path,
          targetPath,
          quality: quality,
          minWidth: minWidth,
          minHeight: minHeight,
          format: CompressFormat.jpeg,
        );

        if (result == null) return null;

        compressedFile = File(result.path);

        final size = await compressedFile.length();

        debugPrint("[$prefix] quality: $quality | size: ${size ~/ 1024} KB");

        /// ✅ Success
        if (size <= targetSize) {
          return compressedFile;
        }

        /// 🔽 Reduce quality step-by-step
        quality -= 10;
      } while (quality >= minQuality);

      /// ⚠️ FINAL FALLBACK (best possible compression)
      return compressedFile;
    } catch (e) {
      debugPrint("CompressError: $e");
      return null;
    }
  }
}
