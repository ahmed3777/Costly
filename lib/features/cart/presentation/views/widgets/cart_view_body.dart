import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/features/checkout/presentation/views/checkout_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_view_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool isCartNotEmpty = false;
  int totalPrice = 0;
  void updateCartState(bool hasItems, int price) {
    setState(() {
      isCartNotEmpty = hasItems;
      totalPrice = price;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomHomeAppBar(
                    scaffoldKey: widget.scaffoldKey,
                    centerText: S.of(context).shoppingCart,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
            CartViewConsumer(onCartUpdated: updateCartState),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isCartNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: (16.0)),
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
                                    Spacer(),
                                    Text(
                                      S.of(context).totalPrice,
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
                                    Spacer(),
                                    Text(
                                      S.of(context).LE,
                                      style: TextStyles.light12,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Visibility(
                      visible: isCartNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: (16.0)),
                        child: CustomTextFormField(
                          borderSideColor: AppColors.grey,
                          hintText: S.of(context).enterVoucherCode,
                          hintTextStyle:
                              TextStyles.light12.copyWith(color: Colors.grey),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16, top: 10),
                            child: Text(
                              S.of(context).apply,
                              style: TextStyles.light16
                                  .copyWith(color: AppColors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Visibility(
                      visible: isCartNotEmpty,
                      child: CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CheckoutView.routeName);
                        },
                        text: S.of(context).checkout,
                        color: AppColors.primaryColor,
                        bottomLeft: 0,
                        bottomRight: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
