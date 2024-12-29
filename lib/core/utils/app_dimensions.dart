import 'package:flutter/material.dart';

class AppDimensions {
  // Ensure this class cannot be instantiated
  AppDimensions._();

  // Device Dimensions
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  // Common Margins
  static const double smallMargin = 8.0;
  static const double mediumMargin = 16.0;
  static const double largeMargin = 24.0;
  static const double extraLargeMargin = 32.0;

  // Common Paddings
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  // Common Spacing (Gaps between widgets)
  static const double smallSpacing = 4.0;
  static const double mediumSpacing = 12.0;
  static const double largeSpacing = 20.0;

  // Border Radius
  static const double smallRadius = 8.0;
  static const double mediumRadius = 16.0;
  static const double largeRadius = 24.0;
  static const double extraLargeRadius = 50.0;

  // Custom percentages of screen size
  static double widthPercentage(BuildContext context, double percentage) =>
      screenWidth(context) * percentage;
  static double heightPercentage(BuildContext context, double percentage) =>
      screenHeight(context) * percentage;
}
