import 'dart:developer';

import 'package:costly/core/helper_functions/show_error_bar.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_keys.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_button_brown.dart';
import 'package:costly/features/cart/data/model/my_cart/cart.dart';
import 'package:costly/features/checkout/data/models/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovingButtonBettweenPageView extends StatelessWidget {
  const MovingButtonBettweenPageView({super.key, required this.pageController, required this.currentPageIndex, required this.cart});
    final PageController pageController;
    final int currentPageIndex ;
    final Cart cart;
    
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
                        
                        if(currentPageIndex == 2){
                          _processPayment(context);

                        }
                  },
                  color: AppColors.primaryColor,
                  text: getNextButtonText(currentPageIndex),
                ),
              ),
            ],
          ),
        );
        
  }

  void _processPayment(BuildContext context) {
      PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
       cart);
      log(paypalPaymentEntity.toJson().toString());
      Navigator.of (context).push( MaterialPageRoute(
        builder: (context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPaypalClientId,
          secretKey: kPaypalSecretKey,
          transactions: [
            paypalPaymentEntity.toJson()
          ],
          note: "Connect us for any question on your order",
          onSuccess: (Map params)async{
            Navigator.pop(context);
            showErrorBar(context, params.toString());
          },
          onError: (error) {
            Navigator.pop(context);
            showErrorBar(context, error.toString());
            print ("onError: $error");
          },
          onCancel: (data) {
            print("onCancel: $data");
          },
        ),
      )

        );
    }
  }