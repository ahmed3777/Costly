
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';

class VoucherFormField extends StatelessWidget {
  const VoucherFormField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: (16.0)),
      child: CustomTextFormField(
        borderSideColor: AppColors.grey,
        hintText: S.of(context).enterVoucherCode,
        hintTextStyle:
            TextStyles.light12.copyWith(color: Colors.grey),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16, top: 10),
          child: Text(
            S.of(context).apply,
            style: TextStyles.light16
                .copyWith(color: AppColors.grey),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}