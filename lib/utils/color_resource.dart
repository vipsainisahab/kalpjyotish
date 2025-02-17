import 'package:flutter/material.dart';

class ColorResources {
  // Primary Colors
  static const Color primaryColor = Color(0xFFDE1F27);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color accentColor = Color(0xFFFFB900);


  // Background Colors
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light Grey
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF); // White

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF212121); // Black
  static const Color textSecondaryColor = Color(0xFF757575); // Grey
  static const Color textHintColor = Color(0xFF9E9E9E); // Light Grey

  // Button Colors
  static const Color buttonColor = Color(0xFF6200EA); // Purple
  static const Color buttonTextColor = Color(0xFFFFFFFF); // White

  // Border Colors
  static const Color borderColor = Color(0xFFE0E0E0); // Light Grey

  // Error Colors
  static const Color errorColor = Color(0xFFB00020); // Red

  // Success Colors
  static const Color successColor = Color(0xFF388E3C); // Green

  // Info Colors
  static const Color infoColor = Color(0xFF1976D2); // Blue

  // Warning Colors
  static const Color warningColor = Color(0xFFFFA000); // Orange

  // Custom Gradient Example
  static const Gradient buttonGradient = LinearGradient(
    colors: [Color(0xFF6200EA), Color(0xFF3700B3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
