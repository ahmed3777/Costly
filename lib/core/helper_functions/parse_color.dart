import 'package:flutter/material.dart';

Color parseColor(String colorValue) {
  // If the color string is in hexadecimal format (with #), remove the # and parse
  if (colorValue.startsWith('#')) {
    colorValue = colorValue.replaceFirst('#', '');
    if (colorValue.length == 6) {
      // If it's a 6-digit hex code, convert it to Color
      return Color(
          int.parse('0xFF$colorValue')); // '0xFF' ensures it's fully opaque
    } else {
      // Handle invalid format, maybe throw or use a default color
      return Colors.black;
    }
  } else {
    // If it's not hex, check if it's a named color and return it
    switch (colorValue.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      default:
        return Colors.black; // Default color for unrecognized values
    }
  }
}
