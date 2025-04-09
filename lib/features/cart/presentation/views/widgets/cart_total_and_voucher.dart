import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartTotalAndVoucher extends StatelessWidget {
  const CartTotalAndVoucher({
    super.key, required this.totalPrice,
  });
  final int totalPrice ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: (16.0)),
            child: SizedBox(
              height: 100.h,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).total,
                      style: TextStyles.regular18,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          S.of(context).sublTota,
                          style: TextStyles.regular13,
                        ),
                        Container(width: 200,
                          height: 1,
                          decoration: BoxDecoration(color:AppColors.grey),
                          ),
                        Text(
                          "$totalPrice ${S.of(context).LE}",
                          style: TextStyles.light12,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          S.of(context).Shipping,
                          style: TextStyles.regular13,
                        ),
                          Container(width: 200,
                          height: 1,
                          decoration: BoxDecoration(color:AppColors.grey),
                          ),
                        Text(
                          S.of(context).LE,
                          style: TextStyles.light12,
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

