import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: AppColors.brownColor.withOpacity(0.5),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.brownColor.withOpacity(0.5),
              ),
            
            ),
          ),
        ),
        
         SizedBox(height: 5.h),
         Text(title,style: TextStyles.regular12,),
    ]);
 
  }
}