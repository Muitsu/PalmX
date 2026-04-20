import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:palmx/core/notifications/handler/notification_handler.dart';

import 'dart:developer' as dev;

@pragma('vm:entry-point')
void bgNotiResponse(NotificationResponse details) {
  final payload = details.payload ?? 'error';
  dev.log('Payload Background Noti: $payload');
  NotificationHandler.handle(payload);
}
