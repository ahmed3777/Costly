import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 140.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      padding: EdgeInsets.all(12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 44.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesNotification,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Notification title',
                  style: TextStyles.regular13.copyWith(color: Colors.black),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,
                        size: 20.sp, color: Colors.red),
                    SizedBox(width: 4.w),
                    Text(
                      'قبل 5 دقائق', // مثال للوقت
                      style: TextStyles.light10.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  'Notification description',
                  style: TextStyles.light10.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Icon(Icons.more_horiz, color: Colors.black),
        ],
      ),
    );
  }
}
