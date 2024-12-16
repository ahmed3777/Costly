import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCheckBoxWidget extends StatefulWidget {
  const CustomCheckBoxWidget(
      {super.key, required this.onChanged, required this.text});

  final ValueChanged<bool> onChanged;
  final String text;
  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            textAlign: isArabic() ? TextAlign.right : TextAlign.left,
            TextSpan(
              children: [
                TextSpan(
                  text: widget.text,
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
