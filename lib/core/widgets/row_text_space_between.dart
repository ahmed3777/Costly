import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SpaceBetweenTextRow extends StatelessWidget {
  final String leftText;
  final String rightText;

  const SpaceBetweenTextRow(
      {Key? key, required this.leftText, required this.rightText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: (8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leftText, style: TextStyles.regular14),
          Text(rightText,
              style: TextStyles.regular12.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
