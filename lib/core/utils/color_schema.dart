import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFF4654); // Example primary color
const Color secondaryColor = Color(0xFFE4D3D6); // Example secondary color
const Color backgroundColor = Color(0xFF3C2A36); // Example background color
const Color surfaceColor = Color(0xFF5A313C); // Example surface color
const Color errorColor = Color(0xFFB00020); // Example error color

const ColorScheme appColorScheme = ColorScheme(
  primary: primaryColor,
  primaryContainer: Color(0xFF943D48), // Darker shade of primary
  secondary: secondaryColor,
  secondaryContainer: Color(0xFF242631), // Darker shade of secondary
  background: backgroundColor,
  surface: surfaceColor,
  error: errorColor,
  onPrimary: Colors.white,
  onSecondary: Color(0xFFE4D3D6),
  onSurface: Color(0xFFE4D3D6),
  onBackground: Color(0xFFE4D3D6),
  onError: Colors.white,
  brightness: Brightness.light, // or Brightness.dark for dark mode
);
