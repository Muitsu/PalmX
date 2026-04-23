import 'dart:developer' as dev;
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/notifications/notification_service.dart';
import 'package:palmx/core/widgets/utils.dart';
import 'package:palmx/data/local/services/database_backup_service.dart';

@injectable
class SettingProvider extends ChangeNotifier {
  final DatabaseBackupService _backupService;
  SettingProvider(this._backupService);
  void logger(String msg) => dev.log(msg, name: "SettingProvider");
  void exportDatabase(BuildContext context) async {
    EasyLoading.show();
    try {
      await _backupService.exportDatabase();
      EasyLoading.showSuccess("Database exported successfully!");
      NotificationService.instance.showNotification(
        title: "Export Success",
        body: "Your database has been exported successfully.",
      );
    } catch (e) {
      logger("Export failed: $e");
      EasyLoading.showError("Export failed. Please try again.");
      NotificationService.instance.showNotification(
        title: "Export Failed",
        body: "Failed to export the database.",
      );
    }
  }

  void importDatabase(BuildContext context) async {
    FilePickerResult? result = await FilePicker.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      String content = await file.readAsString();
      if (!context.mounted) return;
      await _handleImport(context, content);
    } else {
      // User canceled the picker
      if (!context.mounted) return;
      showError(context, message: "Cancel import database.");
    }
  }

  Future<void> _handleImport(BuildContext context, String content) async {
    EasyLoading.show();
    bool success = await _backupService.importDatabase(content);
    EasyLoading.dismiss();
    if (success) {
      if (!context.mounted) return;
      showSuccess(context, message: "Database imported successfully!");
      NotificationService.instance.showNotification(
        title: "Import Success",
        body: "Your database has been imported successfully.",
      );
    } else {
      if (!context.mounted) return;
      showError(context, message: "Import failed. Please check the file.");
      NotificationService.instance.showNotification(
        title: "Import Failed",
        body: "Failed to import the database.",
      );
    }
  }
}
