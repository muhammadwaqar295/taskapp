import 'package:flutter/material.dart';

/// App color constants used throughout the application
/// Centralized color management for better performance and consistency
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary colors
  static const Color primary = Colors.indigo;
  static const Color primaryDark = Color(0xFF2E5090);

  // Text colors
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.black;
  static const Color textLabel = Color(0xFF757575);

  // Background colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color cardBackground = Colors.white;
  static const Color previewBackground = Color(0xFFF5F5F5);

  // Border colors
  static const Color borderLight = Color(0xFFE0E0E0);

  // Cursor colors
  static const Color cursorColor = Colors.black;

  // Hashtag highlighting
  static const Color hashtagColor = Colors.indigo;
}
