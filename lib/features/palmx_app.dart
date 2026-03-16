import 'package:flutter/material.dart';
import 'package:palmx/features/main-navigation/main_page.dart';

class PalmXApp extends StatelessWidget {
  const PalmXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PalmX',
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
