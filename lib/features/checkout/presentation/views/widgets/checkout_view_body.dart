import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_button_brown.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/checkout/presentation/views/widgets/checkout_steps_pageview.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'checkout_steps.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeAppBar(
          scaffoldKey: widget.scaffoldKey,
          centerText: S.of(context).checkout,
        ),
        SizedBox(height: 6.h),
        CheckoutSteps(currentPageIndex: currentPageIndex),
        Expanded(child: CheckoutStepsPageView(pageController: pageController)),
        Padding(
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
        ),
      ],
    );
  }

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
}
