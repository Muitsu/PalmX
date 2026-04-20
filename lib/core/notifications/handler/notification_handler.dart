import 'package:palmx/core/notifications/handler/notification_payload.dart';
import 'dart:developer' as dev;

class NotificationHandler {
  static Future<void> handle(String? payload) async {
    if (payload == null) return;

    final data = _parse(payload);

    switch (data.type) {
      case NotiPayLoad.normalPayParking:
        _handlePayParking(data);
        break;
    }
  }

  static NotificationData _parse(String payload) {
    // if using JSON (recommended)
    // final json = jsonDecode(payload);

    return NotificationData(
      type: NotiPayLoad.normalPayParking, // adapt this
      raw: payload,
    );
  }

  static Future<void> _handlePayParking(NotificationData data) async {
    // ⚠️ IMPORTANT:
    // Background isolate cannot navigate directly

    // Option A: Save intent (recommended)
    // Option B: trigger local storage / stream

    // Example:
    dev.log('Handle Pay Parking');
  }
}

class NotificationData {
  final NotiPayLoad type;
  final String raw;

  NotificationData({required this.type, required this.raw});
}
