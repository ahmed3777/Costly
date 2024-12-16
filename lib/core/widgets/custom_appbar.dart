import 'package:costly/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
      {super.key,
      this.title,
      required this.backgroundColor,
      this.arrowColor,
      this.imageAsset});

  final String? title;
  final Color backgroundColor;
  final Color? arrowColor;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style:
                  TextStyles.bold24.copyWith(color: AppColors.secondaryColor),
            )
          : null, // Set to null if there's no title
      centerTitle: true,
      backgroundColor: backgroundColor,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: arrowColor ?? Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),

      flexibleSpace: imageAsset != null
          ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Image.asset(
                  imageAsset!,
                  fit: BoxFit.cover, // Adjust as needed
                ),
              ),
            )
          : null, // No image if not provided
    );
  }
}
