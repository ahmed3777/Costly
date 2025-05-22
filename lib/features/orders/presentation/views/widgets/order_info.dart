import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo(
      {super.key,
      required this.paymentMethod,
      required this.shippingAddress,
      required this.billingAddress,
      required this.orderStatus, required this.totalAmount});

  final String paymentMethod;
  final String shippingAddress;
  final String billingAddress;
  final String orderStatus;
  final int totalAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Information",
          style: TextStyles.regular14,
        ),
        SizedBox(height: 8.h),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Shipping Address: ",
                style: TextStyles.regular12.copyWith(color: Colors.grey),
              ),
              TextSpan(
                text: shippingAddress,
                style: TextStyles.regular12,
              ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
        Text.rich( TextSpan(
            children: [
              TextSpan(
                text: "Payment method: ",
                style: TextStyles.regular12.copyWith(color: Colors.grey),
              ),
              TextSpan(
                text: paymentMethod,
                style: TextStyles.regular12,
              ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Billing Address: ",
                style: TextStyles.regular12.copyWith(color: Colors.grey),
              ),
              TextSpan(
                text: billingAddress,
                style: TextStyles.regular12,
              ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Total Amount: ",
                style: TextStyles.regular12.copyWith(color: Colors.grey),
              ),
              TextSpan(
                text: totalAmount.toString(),
                style: TextStyles.regular12,
              ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
          Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Total Amount: ",
                style: TextStyles.regular12.copyWith(color: Colors.grey),
              ),
              TextSpan(
                text: "LE 100",
                style: TextStyles.regular12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
