import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.topLeftcircular,
    this.topRightcircular,
    this.bottomLeftcircular,
    this.bottomRightcircular,
  });
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? topLeftcircular;
  final double? topRightcircular;
  final double? bottomLeftcircular;
  final double? bottomRightcircular;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 52,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeftcircular ?? 50),
                topRight: Radius.circular(topRightcircular ?? 50),
                bottomLeft: Radius.circular(bottomLeftcircular ?? 50),
                bottomRight: Radius.circular(bottomRightcircular ?? 50),
              ),
            ),
            backgroundColor: color ?? AppColors.secondaryColor,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  text,
                  style: TextStyles.bold18.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
    });
  }
}
