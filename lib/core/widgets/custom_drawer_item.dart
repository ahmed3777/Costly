import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildDrawerItem({
  String? iconPath,
  IconData? icon,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: iconPath != null
        ? SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(
                AppColors.secondaryColor, BlendMode.srcIn),
            width: 20,
            height: 20,
          )
        : Icon(icon, color: AppColors.secondaryColor),
    title: Text(
      title,
      style: TextStyles.regular18.copyWith(color: Colors.white),
    ),
    onTap: onTap,
  );
}
