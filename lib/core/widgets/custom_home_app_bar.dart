import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_search_text_field.dart';
import 'package:costly/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar(
      {super.key, this.centerText, required this.scaffoldKey, this.visible});
  final String? centerText;
  final bool? visible;
  final GlobalKey<ScaffoldState>
      scaffoldKey; // Accept scaffoldKey as a parameter

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120.h,
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
                centerText != null && centerText!.isNotEmpty
                    ? Text(
                        centerText!,
                        style: TextStyles.medium24.copyWith(
                            color: Colors
                                .white), // Customize your text style as needed
                      )
                    : SizedBox(
                        width: 152.w,
                        height: 31.30.h,
                        child: Image.asset("assets/images/costly.png"),
                      ),
                NotificationWidget(
                  visible: visible ?? false,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          top: 100,
          child: SearchField(
            controller: TextEditingController(),
            onSearchPressed: () {},
          ),
        ), //search
      ]),
    );
  }
}
