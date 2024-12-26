import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    required this.hintText,
    this.hintTextStyle,
    this.textStyle,
  });
  final String hintText;
  final void Function(String?)? onSaved;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validatorMassege: 'Please Enter Valid Password',
      obscureText: obscureText,
      onSaved: widget.onSaved,
      cursorColor: Colors.grey,
      textStyle: widget.textStyle,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off,
                color: Color(0xffC9CECF),
              )
            : const Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
      ),
      hintText: widget.hintText,
      hintTextStyle: widget.hintTextStyle ??
          TextStyles.light16.copyWith(
              color: AppColors.white, decoration: TextDecoration.none),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
