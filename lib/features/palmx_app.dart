import 'package:flutter/material.dart';
import 'package:palmx/core/service/app_navigator.dart';
import 'package:palmx/core/theme/app_theme.dart';
import 'package:palmx/features/main-navigation/main_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PalmXApp extends StatelessWidget {
  const PalmXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PalmX',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      builder: EasyLoading.init(),
      home: const MainPage(),
    );
  }
}
