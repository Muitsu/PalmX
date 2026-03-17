import 'package:flutter/material.dart';

import 'app_color_pallets.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData dark = ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[AppColorPalettes.dark],
  );

  static ThemeData light = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[AppColorPalettes.light],
  );
}

extension ThemeX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
