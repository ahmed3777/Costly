import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_button_brown.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovingButtonBettweenPageView extends StatelessWidget {
  const MovingButtonBettweenPageView({super.key, required this.pageController, required this.currentPageIndex});
    final PageController pageController;
    final int currentPageIndex ;
    
  @override
  Widget build(BuildContext context) {
     String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return S.of(context).next;
      case 1:
        return S.of(context).next;
      case 2:
        return S.of(context).pay;
      default:
        return S.of(context).next;
    }
  }
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 160.w,
                  height: 52.h,
                  child: CustomButtonBrown(
                    onPressed: () {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: S.of(context).back,
                    borderRadius: 50,
                  )),
              SizedBox(
                width: 160.w,
                height: 52.h,
                child: CustomButton(
                  onPressed: () {
                    pageController.animateToPage(currentPageIndex + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  color: AppColors.primaryColor,
                  text: getNextButtonText(currentPageIndex),
                ),
              ),
            ],
          ),
        );
        
  }
  
}
