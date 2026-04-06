import 'package:flutter/material.dart';
import 'package:palmx/core/di/injection.dart';
import 'package:palmx/core/provider/app_provider.dart';
import 'package:palmx/features/palmx_app.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    MultiProvider(providers: AppProviders.providers, child: const PalmXApp()),
  );
}
