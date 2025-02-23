import 'package:flutter/material.dart';

class ColorOptionWidget extends StatelessWidget {
  final Color colorValue;

  const ColorOptionWidget({
    super.key,
    required this.colorValue,
  });

  @override
  Widget build(BuildContext context) {
    // Convert the Color to a hex string for display

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Circular Color Display
        Container(
          width: 20, // Size of the color circle
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorValue, // The color of the circle
          ),
        ),
        SizedBox(width: 2), // Spacing between circle and color value text
        // Color Value (Hex or RGB format)
        // Text(
        //   '#$colorHex', // Display the color value (Hexadecimal format)
        //   style: TextStyle(
        //     fontSize: 12.0,
        //     color: Colors.black,
        //   ),
        // ),
      ],
    );
  }
}
