import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingConfig {
  static Future<void> init() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..boxShadow = <BoxShadow>[]
      ..maskType = EasyLoadingMaskType.black
      ..progressColor = Colors.deepOrange
      ..indicatorColor = Colors.deepOrange
      ..textColor = Colors.deepOrange
      ..indicatorSize = 45.0
      ..radius = 20
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static void showCustom({Widget? indicator, required String message}) {
    EasyLoading.instance
      ..maskColor = Colors.white
      ..maskType = EasyLoadingMaskType.custom
      ..backgroundColor = Colors.transparent;
    EasyLoading.show(
      indicator: Column(
        children: [
          indicator ?? const SizedBox.shrink(),
          SizedBox(height: indicator != null ? 10 : 0),
          Text(message, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}
