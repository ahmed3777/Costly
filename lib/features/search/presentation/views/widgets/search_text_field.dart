import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback onSearchPressed;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    required this.controller,
    required this.onSearchPressed,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 40.h,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        onSubmitted: (value) {
          onSearchPressed();
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: onSearchPressed, icon: const Icon(Icons.search)),
          hintStyle: TextStyles.regular14.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText: onChanged == null ? 'Search' : '',
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: Colors.grey,
      ),
    );
  }
}
