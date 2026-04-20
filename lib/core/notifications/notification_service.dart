// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:palmx/core/notifications/handler/notification_background.dart';
import 'package:palmx/core/notifications/handler/notification_foreground.dart';
import 'package:palmx/core/notifications/notification_settings.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'dart:developer' as dev;

class NotificationService {
  static NotificationService? _instance;
  late final FlutterLocalNotificationsPlugin _notifications;
  late final NotificationsSetting _notiSettings;
  late NotificationDetails _cachedDetails;

  NotificationService._internal() {
    _notifications = FlutterLocalNotificationsPlugin();
    _notiSettings = NotificationsSetting();
  }

  static NotificationService get instance {
    _instance ??= NotificationService._internal();
    return _instance!;
  }

  void _logger(String msg) => dev.log("", name: "NotificationService");
  // ----------------------------------------------------
  // Initialize Notification
  // ----------------------------------------------------
  Future<void> init() async {
    //if web will return none
    if (kIsWeb || Platform.isLinux) return;
    try {
      await _notifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
      const android = AndroidInitializationSettings('@mipmap/launcher_icon');
      const iOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );
      const settings = InitializationSettings(android: android, iOS: iOS);
      await _notifications.initialize(
        settings: settings,
        onDidReceiveBackgroundNotificationResponse: bgNotiResponse,
        onDidReceiveNotificationResponse: fgNotiResponse,
      );
      tz.initializeTimeZones();
      _cachedDetails = NotificationDetails(
        android: _notiSettings.androidNotiDetails(),
        iOS: _notiSettings.iosNotiDetails(),
      );
    } catch (e) {
      _logger('Error initializing notifications: $e');
      rethrow;
    }
  }

  // ----------------------------------------------------
  // Details Cache
  // ----------------------------------------------------
  NotificationDetails _notificationsDetail() => _cachedDetails;

  // ----------------------------------------------------
  // Normal Notifications
  // ----------------------------------------------------
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    //if web will return none
    if (kIsWeb || Platform.isLinux) return;
    try {
      return _notifications.show(
        id: id,
        title: title ?? 'Empty Title',
        body: body ?? 'Empty Body',
        notificationDetails: _notificationsDetail(),
        payload: payload ?? 'Empty Payload',
      );
    } catch (e) {
      _logger('Error showing notification: $e');
    }
  }

  // ----------------------------------------------------
  // Periodic Notifications
  // ----------------------------------------------------
  Future<void> showPeriodicNotification({
    required int id,
    required String title,
    required String body,
    required RepeatInterval repeatInterval,
    String? payload,
  }) async {
    if (kIsWeb || Platform.isLinux) return;
    try {
      return _notifications.periodicallyShow(
        id: id,
        title: title,
        body: body,
        repeatInterval: repeatInterval,
        notificationDetails: _notificationsDetail(),
        payload: payload,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
      );
    } catch (e) {
      _logger('Error showing periodic notification: $e');
    }
  }

  // ----------------------------------------------------
  // Schedule Notifications
  // ----------------------------------------------------
  Future<void> setScheduledNotification({
    required int id,
    required String title,
    required String body,
    required String? payload,
    required DateTime start,
    required DateTime end,
  }) async {
    //if web will return none
    if (kIsWeb || Platform.isLinux) return;
    try {
      DateTime startDatetime = start;
      DateTime endDatetime = end;

      Duration difference = endDatetime.difference(startDatetime);
      return _notifications.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tz.TZDateTime.from(
          DateTime.now().add(difference),
          tz.local,
        ),
        notificationDetails: _notificationsDetail(),
        // uiLocalNotificationDateInterpretation:
        //     UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: payload,
      );
    } catch (e) {
      _logger('Error scheduling notification: $e');
    }
  }

  // ----------------------------------------------------
  // Stop Notifications
  // ----------------------------------------------------
  void stopNotification({required int id}) {
    //if web will return none
    if (kIsWeb || Platform.isLinux) return;
    try {
      _notifications.cancel(id: id);
    } catch (e) {
      _logger('Error stopping notification: $e');
    }
  }
}
