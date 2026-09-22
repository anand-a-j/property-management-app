// Improved Flutter import/export service with custom errors and dated filenames
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../habit/domain/habit.dart';

/*
---------------------------------------------------------
 WHY WE USE A BACKUP "VERSION" FIELD
---------------------------------------------------------

Every time the user exports data, we include:
  "version": 1

This version number tells the app:
  → what format the backup file uses
  → what fields exist
  → how to import it safely

---------------------------------------------------------
 WHAT HAPPENS WHEN THE APP GETS NEW FEATURES?
---------------------------------------------------------

In the future, we may add new fields:
  - reminders
  - sub habits
  - analytics
  - new settings
  - new DB structure

Older backup files will NOT contain these fields.

Without a version system, importing old backups can:
  ❌ crash the app
  ❌ lose user data
  ❌ break new features

---------------------------------------------------------
 HOW VERSIONING FIXES THIS
---------------------------------------------------------

When we change the data structure, we simply increase:
  version: 2
  version: 3
  version: 4
  ...etc.

Then during import we check:

  if (version == 1) → import using old rules
  if (version == 2) → import + add missing fields
  if (version == 3) → import + migrate to new structure

This lets us:
  ✔ safely handle old backup files
  ✔ add new fields without breaking anything
  ✔ migrate data if needed
  ✔ always keep backward compatibility

---------------------------------------------------------
 BENEFIT FOR THE USER
---------------------------------------------------------

- Old backups from last year will still work
- New updates will not break old data
- App will never crash due to missing fields
- Backup/restore stays smooth forever

---------------------------------------------------------
 SUMMARY
---------------------------------------------------------

Adding a version field means:
  "Your backup will ALWAYS work,
   even if the app changes a lot in the future."

This is the simplest and most future-proof design.
---------------------------------------------------------
*/
class ImportExportService {
  /// Export habits with date-based filename & custom user-friendly errors
  static Future<void> exportHabit(List<Habit> habits) async {
    try {
      // Create metadata wrapper
      final backupJson = {
        "version": 1, // BACKUP FORMAT VERSION
        "exported_at": DateTime.now().toIso8601String(),
        "habits": habits.map((h) => h.toJson()).toList(),
      };

      final jsonString = jsonEncode(backupJson);

      final now = DateTime.now();
      final formattedDate = "${now.day}-${now.month}-${now.year}";
      final fileName = "habits_backup_$formattedDate.json";

      final directory = await getApplicationDocumentsDirectory();
      final tempFilePath = '${directory.path}/$fileName';
      final tempFile = File(tempFilePath);
      await tempFile.writeAsString(jsonString);

      final bytes = utf8.encode(jsonString);

      final savedPath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Backup File',
        fileName: fileName,
        bytes: bytes,
      );

      if (savedPath == null) {
        throw Exception("User cancelled save dialog");
      }
    } catch (e) {
      debugPrint("export error : ${e.toString()}");
      // throw Exception("Unable to export data. Please try again.");
    }
  }

  /// Import habits with error handling
  static Future<List<Habit>> importHabits() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result == null || result.files.single.path == null) {
        throw Exception("No file selected.");
      }

      final file = File(result.files.single.path!);
      final content = await file.readAsString();

      final decoded = jsonDecode(content);

      // Validate backup format
      if (decoded is! Map || !decoded.containsKey("habits")) {
        throw Exception("Invalid backup format");
      }

      final version = decoded["version"] ?? 1;
      final habitsList = decoded["habits"] as List;

      // In future: handle version migrations here
      if (version == 1) {
        return habitsList.map((json) => Habit.fromJson(json)).toList();
      }

      throw Exception("Unsupported backup version: $version");
    } catch (e) {
      debugPrint("import error : ${e.toString()}");
      throw Exception(
        "Unable to import data. Make sure the backup file is valid.",
      );
    }
  }
}
