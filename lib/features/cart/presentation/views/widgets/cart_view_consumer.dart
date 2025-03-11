import 'package:costly/core/helper_functions/show_error_bar.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_total_and_voucher.dart';
import 'package:costly/features/cart/presentation/views/widgets/voucher_form_field.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_cart_button.dart';

class CartViewConsumer extends StatelessWidget {
  const CartViewConsumer({super.key});
  // final Function(bool, int)? onCartUpdated;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
        showErrorBar(context, state.message); // ✅ Now runs *after* the frame is built
        }
      },
      builder: (context, state) {
       //  Show Loading Indicator
        if (state is CartLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
              // Handle Success
        if (state is CartSuccess) {
          final cart = state.cart.payload;
          final cartItemsList = cart.items ?? [];
          if (cartItemsList.isEmpty) {
            return SliverImageEmptyCart();
          } else {
            return SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) {
                
                  if (index == 0) {
                    // Return the CartItemList for the first item in the list
                    return CartItemList(cart: cart);
                  } else if (index == 1) {
                    // Return the CartTotalAndVoucher for the second item in the list
                    return CartTotalAndVoucher(totalPrice: cart.totalPrice!);
                  }
                 else if (index == 2) {
                 return  VoucherFormField();
                 }
                 else if (index == 3) {
                 return  CustomCartButton(cart: cart);
                 }
                },
                childCount: 4, // Only two items in the list
              ),
            );
          }
        }
        // Default Case (should not happen)
        return  SliverToBoxAdapter(
          child: Center(child: Text(S.of(context).unexpectedState)),
        );
      },
    );
  }
}



class SliverImageEmptyCart extends StatelessWidget {
  const SliverImageEmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        Center(
          child: SizedBox(
            width: 200.w,
            height: 200.h,
            child: Image.asset(Assets.imagesEmptycart),
          ),
        ),
        SizedBox(height: 100.h),
        Center(
            child: SizedBox(
          width: 300.w,
          child: CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
            text: S.of(context).start_shopping,
            color: AppColors.secondaryColor,
          ),
        )),
      ]),
    );
  }
}
