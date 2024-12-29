import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomHomeAppBar(
                    scaffoldKey: widget.scaffoldKey,
                    centerText: "Shopping Cart",
                    visible: true,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
            CartItemList(),
          ],
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomButton(
              onPressed: () {},
              text: "Checkout",
              color: AppColors.primaryColor,
              bottomLeft: 0,
              bottomRight: 0,
            ))
      ],
    );
  }
}
