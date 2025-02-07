import 'package:costly/core/helper_functions/is_arbic.dart';
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
    print("Cart State Updated: hasItems=$hasItems, totalPrice=$price"); // Log cart state
    setState(() {
      isCartNotEmpty = hasItems;
      totalPrice = price;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomHomeAppBar(
                      scaffoldKey: widget.scaffoldKey,
                      centerText:isArabic() ? "سلة المشتريات" : "Shopping Cart",
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
              CartViewConsumer(onCartUpdated:updateCartState)
            ],
          ),
        ),

        Visibility(
          visible: isCartNotEmpty ,
          child: Positioned(
            bottom: 40.h,
            left: 0,
            right: 0, 
            child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: (16.0)),
                      child: SizedBox(
                        height: 100.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text("Sub Total: _____________ $totalPrice\$", style: TextStyles.regular12,),
                            Text("Shipping: _____________ 0\$", style: TextStyles.regular12,),
                            Text("Total: _____________ $totalPrice\$", style: TextStyles.regular12,),
                            const Spacer(),
                        ]),
                      ),
                    ),
          ),
        ),

        Visibility(
          visible: isCartNotEmpty,
          child: Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomButton(
                onPressed: () {},
                text: "Checkout",
                color: AppColors.primaryColor,
                bottomLeft: 0,
                bottomRight: 0,
              )),
        )
        ]);
              }
  }