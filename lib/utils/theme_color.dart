import 'package:flutter/material.dart';

class ThemeColor {
  // Primary Colors
  static const Color primaryColor = Color(0xFFE1353C);
  static const Color secondaryColor = Color(0xFF03DAC6);

  // Background Colors
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light Grey
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF); // White

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF212121); // Black
  static const Color textWhite70Color = Color(0xB3FFFFFF); // Black
  static const Color textSecondaryColor = Color(0xFF757575); // Grey
  static const Color textHintColor = Color(0xFF9E9E9E); // Light Grey
  static const Color textWhiteColor = Color(0xFFFFFFFF); // Light Grey

  // Use colors
  static const Color amberColor = Color(0xFFFFB900);
  static const Color homeScreenColor = Color(0xFFF4F4F4);
  static const Color astroGreen = Color(0xFF157B11); // Green
  static const Color deepPurple = Color(0xFF673AB7); // Purple
  static const Color blueColor = Color(0xFF2196F3); // blue
  static const Color redColor = Color(0xFFC62828); // Red
  static const MaterialColor greyColor = Colors.grey; // grey
  static const Color blackColor = Color(0xFF000000); // Black
  static const Color lightBlackColor = Color(0xDD000000); // Black
  static const Color transparent = Color(0x00000000); // Black

  // Button Colors
  static const Color buttonColor = Color(0xFF157B11); // Green
  static const Color buttonSecondColor = Color(0xFF6200EA); // Purple
  static const Color buttonTextColor = Color(0xFFFFFFFF); // White

  // Border Colors
  static const Color borderColor = Color(0xFFE0E0E0); // Light Grey

  // Messages Colors
  static const Color errorColor = Color(0xFFB00020); // Error Colors

  static const Color successColor = Color(0xFF388E3C); // Success Colors

  static const Color infoColor = Color(0xFF1976D2); // Info Colors

  static const Color warningColor = Color(0xFFFFA000); // Warning Colors

  // Custom Gradient Example
  static const Gradient buttonGradient = LinearGradient(
    colors: [Color(0xFF6200EA), Color(0xFF3700B3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
