import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsSetting {
  // ----------------------------------------------------
  // Android Settings
  // ----------------------------------------------------
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'Default Id', //id
    'Default Name', //name
    description: 'Default description', //name
    importance: Importance.max,
    playSound: true,
  );

  AndroidNotificationDetails androidNotiDetails({
    String? id,
    String? name,
    String? channelDescription,
  }) {
    return AndroidNotificationDetails(
      id ?? channel.id,
      name ?? channel.name,
      channelDescription: channelDescription ?? channel.description,
      importance: Importance.max,
      priority: Priority.high,
      color: Colors.blue,
      playSound: true,
      icon: '@mipmap/launcher_icon',
    );
  }

  // ----------------------------------------------------
  // iOS Settings
  // ----------------------------------------------------
  DarwinNotificationDetails iosNotiDetails({
    bool? presentAlert,
    bool? presentBadge,
    bool? presentSound,
  }) {
    return DarwinNotificationDetails(
      sound: 'default.wav',
      presentAlert: presentAlert ?? true,
      presentBadge: presentBadge ?? true,
      presentSound: presentSound ?? true,
    );
  }
}
