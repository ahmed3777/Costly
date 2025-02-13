import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButtonBrown extends StatelessWidget {
  const CustomButtonBrown({
    super.key,
    required this.onPressed,
    required this.text,
    this.color, this.borderRadius, this.mainAxisAlignment,
  });
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double ? borderRadius;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius ?? 10,
              ),
            ),
            backgroundColor: color ?? AppColors.brownColor,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  text,
                  style: TextStyles.regular16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
