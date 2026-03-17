import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppColorPalettes {
  static const dark = AppColors(
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    surfaceVariant: Color(0x1AFFFFFF),

    // Orange as main accent (slightly softened)
    primary: Color(0xFFFF8A3D),
    secondary: Color(0xFFFFA366),

    textPrimary: Colors.white,
    textSecondary: Color(0xB3FFFFFF),
    textMuted: Color(0xFF9E9E9E),

    border: Color(0x33FFFFFF),

    success: Color(0xFF22C55E),
    warning: Color(0xFFFF8A3D),
  );

  static const light = AppColors(
    // Clean white base (slightly warm)
    background: Color(0xFFFFFBF7),
    surface: Colors.white,
    surfaceVariant: Color(0xFFFFF1E6),

    // Minimal orange (not too strong)
    primary: Color(0xFFFF7A1A),
    secondary: Color(0xFFFFA366),

    textPrimary: Color(0xFF1A1A1A),
    textSecondary: Color(0xFF666666),
    textMuted: Color(0xFF9CA3AF),

    border: Color(0xFFF1E5D9),

    success: Color(0xFF16A34A),
    warning: Color(0xFFFF7A1A),
  );
}
