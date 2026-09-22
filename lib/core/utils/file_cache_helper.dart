import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class FileCahceHelper {
  static Future<File?> cacheFile(String url) async {
    try {
      final cacheDir = await getTemporaryDirectory();
      final fileName = url.split('/').last;
      final filePath = "${cacheDir.path}/$fileName";
      final file = File(filePath);

      if (await file.exists()) {
        return file;
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) return null;

      await file.writeAsBytes(response.bodyBytes);
      return file;
    } catch (e) {
      debugPrint("CacheFile Error: $e");
      return null;
    }
  }
}
