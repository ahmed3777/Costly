import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryName});
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: (2)),
      child: Container(
          width: 100,
          height: 40,
          decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.40, color: Color(0xFF9B9B9B)),
          borderRadius: BorderRadius.circular(40),
               ),
                    ),
              child: Center(
                    child: Text(
                    categoryName??'category',
                    style: TextStyles.regular14.copyWith(color: Colors.black),
                    ),
                      ),
                  
      
      ),
    );
  }
}