import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/local/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

@lazySingleton
class DatabaseBackupService {
  final AppDatabase _db;
  DatabaseBackupService(this._db);

  void logger(String msg) => dev.log(msg, name: "DatabaseBackupService");

  /// EXPORT: Collects all data and generates a JSON file to share
  Future<void> exportDatabase() async {
    try {
      // 1. Fetch data (Potential DB error)
      final activities = await _db.select(_db.activityTable).get();
      final fields = await _db.select(_db.fieldTable).get();
      final materials = await _db.select(_db.materialTable).get();
      final logs = await _db.select(_db.operationLogsTable).get();

      final Map<String, dynamic> exportData = {
        'activities': activities,
        'fields': fields,
        'materials': materials,
        'operationLogs': logs,
      };

      // 2. Serialize (Potential Memory error)
      final jsonString = jsonEncode(exportData);

      // 3. Write to disk (Potential Storage error)
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/backup.json');
      await file.writeAsString(jsonString);

      // 4. Share (Potential System UI error)
      ShareParams params = ShareParams(
        text: 'My App Database Backup',
        files: [XFile(file.path)],
      );
      await SharePlus.instance.share(params);
    } catch (e) {
      rethrow;
    }
  }

  /// IMPORT: Takes a JSON string and populates the database
  Future<bool> importDatabase(String jsonString) async {
    try {
      final Map<String, dynamic> data = jsonDecode(jsonString);

      await _db.transaction(() async {
        // 1. Clear existing data (Optional, but prevents ID conflicts)
        await _db.delete(_db.activityTable).go();
        await _db.delete(_db.fieldTable).go();
        await _db.delete(_db.materialTable).go();
        await _db.delete(_db.operationLogsTable).go();

        // 2. Import ActivityTable
        if (data['activities'] != null) {
          for (var item in data['activities']) {
            await _db
                .into(_db.activityTable)
                .insert(ActivityTableData.fromJson(item));
          }
        }

        // 3. Import FieldTable
        if (data['fields'] != null) {
          for (var item in data['fields']) {
            await _db
                .into(_db.fieldTable)
                .insert(FieldTableData.fromJson(item));
          }
        }

        // 4. Import MaterialTable
        if (data['materials'] != null) {
          for (var item in data['materials']) {
            await _db
                .into(_db.materialTable)
                .insert(MaterialTableData.fromJson(item));
          }
        }

        // 5. Import OperationLogs
        if (data['operationLogs'] != null) {
          for (var item in data['operationLogs']) {
            await _db
                .into(_db.operationLogsTable)
                .insert(OperationLogsTableData.fromJson(item));
          }
        }
      });
      return true; // Success!
    } on FormatException catch (e) {
      logger("Invalid JSON format: $e");
      return false;
    } catch (e) {
      logger("Database Import Error: $e");
      return false;
    }
  }
}
