import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.suffixIcon,
      this.onSaved,
      this.obscureText = false,
      this.validatorMassege,
      this.hintTextStyle,
      this.cursorColor,
      this.textStyle, this.validator});

  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Color? cursorColor;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String?  validatorMassege;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final String? Function(String?)? validator; // Add this line

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        maxLines: 1,
        autocorrect: false,
        enableSuggestions: false,
        cursorColor: cursorColor ?? AppColors.white,
        style: textStyle ??
            TextStyles.light16.copyWith(
                color: AppColors.white, decoration: TextDecoration.none),
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator ?? (value) {
          if (value == null || value.isEmpty) {
            return validatorMassege;
          }
          
          return null;
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          fillColor: const Color.fromARGB(0, 255, 255, 255),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 1, // Set the width of the border
                color: AppColors.secondaryColor
                    .withOpacity(0.5), // Set the color of the border
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 1, // Set the width of the border
                color: AppColors.secondaryColor
                    .withOpacity(0.5), // Set the color of the border
              )),
          hintText: hintText,
          hintStyle: hintTextStyle ??
              TextStyles.light16.copyWith(color: AppColors.white),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
