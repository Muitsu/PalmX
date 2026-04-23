import 'package:flutter/services.dart';
import 'package:palmx/core/di/injection.dart';
import 'package:palmx/core/notifications/notification_service.dart';
import 'package:palmx/core/service/easyloading_config.dart';

class AppInitializer {
  static Future<void> init() async {
    // Dependency Injection Setup
    configureDependencies();
    await Future.wait([
      // Notification Initialization
      NotificationService.instance.init(),
      // Easy Loading
      EasyLoadingConfig.init(),
      // System Orientation : Only Allow Vertical
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
    ]);
  }
}
