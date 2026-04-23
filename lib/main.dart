import 'package:flutter/material.dart';
import 'package:palmx/core/app_initializer.dart';
import 'package:palmx/core/provider/app_provider.dart';
import 'package:palmx/features/palmx_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  runApp(
    MultiProvider(providers: AppProviders.providers, child: const PalmXApp()),
  );
}
