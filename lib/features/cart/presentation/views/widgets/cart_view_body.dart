import 'package:costly/core/widgets/custom_textfield.dart';
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
    print(
        "Cart State Updated: hasItems=$hasItems, totalPrice=$price"); // Log cart state
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
            SliverToBoxAdapter(child: SizedBox(height: 180.h)),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
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
                        const Spacer(),
                        Text(
                          "${S.of(context).sublTota}: _____________ $totalPrice\$",
                          style: TextStyles.regular12,
                        ),
                        Text(
                          "${S.of(context).tax}: _____________ 0\$",
                          style: TextStyles.regular12,
                        ),
                        Text(
                          "${S.of(context).totalPrice}: _____________ $totalPrice\$",
                          style: TextStyles.regular12,
                        ),
                        const Spacer(),
                      ]),
                ),
              ),
            ),
          
        
        
          Visibility(
            visible: isCartNotEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: (16.0)),
              child: CustomTextFormField(hintText: S.of(context).enterVoucherCode,
              hintTextStyle: TextStyles.regular12.copyWith(color: Colors.grey),
              suffixIcon:  Padding(
                padding: const EdgeInsets.only(right: 16 ,top: 10),
                child: Text("Apply",style: TextStyles.regular12.copyWith(color: AppColors.grey),),
              ),
               keyboardType: TextInputType.text,),
            ),
          ),  
              SizedBox(height: 12.h),
        Visibility(
          visible: isCartNotEmpty,
          child: CustomButton(
            onPressed: () {},
            text: "Checkout",
            color: AppColors.primaryColor,
            bottomLeft: 0,
            bottomRight: 0,
          ),
        )
          ],
        ),
      ),
    ]);
  }
}
