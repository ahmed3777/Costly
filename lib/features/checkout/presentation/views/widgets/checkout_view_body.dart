import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/cart/data/model/my_cart/cart.dart';
import 'package:costly/features/checkout/presentation/views/widgets/checkout_steps_pageview.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'checkout_steps.dart';
import 'moving_button_bettween_pageview.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody(
      {super.key, required this.scaffoldKey, required this.cart});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Cart cart;
  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  String paymentMethod = "paypal"; // ← هنا نخزنها

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
        CheckoutSteps(
            currentPageIndex: currentPageIndex, pageController: pageController),
        Expanded(
            child: CheckoutStepsPageView(
          pageController: pageController,
          onPaymentMethodChanged: (value) {
            setState(() {
              paymentMethod = value;
            });
          },
        )),
        MovingButtonBettweenPageView(
          pageController: pageController,
          currentPageIndex: currentPageIndex,
          cart: widget.cart,
          paymentMethod: paymentMethod,
        ),
      ],
    );
  }
}
