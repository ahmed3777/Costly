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
  late PageController pageController ;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomHomeAppBar(
          scaffoldKey: widget.scaffoldKey,
          centerText: S.of(context).checkout,
        ),
        SizedBox(height: 6.h),
       CheckoutSteps(),
       Expanded(child: CheckoutStepsPageView(pageController: pageController)
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width:160.w , height: 52.h,child: CustomButtonBrown(onPressed: (){}, 
                mainAxisAlignment: MainAxisAlignment.center,
              text: "Back",
                borderRadius: 50,
              )),
              SizedBox(width:160.w , height: 52.h,child: CustomButton(onPressed: (){},
              color: AppColors.primaryColor
              , text: "Next")),
            ],
          ),
        )
      ],
    );
  }
}

