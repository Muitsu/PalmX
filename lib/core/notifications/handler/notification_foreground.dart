import 'dart:developer' as dev;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:palmx/core/notifications/handler/notification_handler.dart';

//Add your logic here
void fgNotiResponse(NotificationResponse details) {
  final payload = details.payload ?? 'error';
  dev.log('Payload Foreground Noti: $payload');

  NotificationHandler.handle(payload);
}
