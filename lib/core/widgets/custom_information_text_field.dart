import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomInformationTextField extends StatelessWidget {
  const CustomInformationTextField({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0.40,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          maxLines: 1,
          style: TextStyles.light12.copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
