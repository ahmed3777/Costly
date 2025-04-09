import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/features/cart/data/model/my_cart/cart.dart';
import 'package:costly/features/cart/data/model/my_cart/item.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is CartSuccess) { 
          Cart cart = state.cart.payload;
          List<Item> cartItemsList = cart.items ?? [];
          if (cartItemsList.isEmpty) {
            return SliverImageEmptyCart();
          } else {
            return SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {return CartItemList(cart: cart);} 
                  else if (index == 1) {return CartTotalAndVoucher(totalPrice: cart.totalPrice!);}
                  else if (index == 2) {return  VoucherFormField();}
                  else if (index == 3) {return  CustomCartButton(cart: cart);}
                  return null;
                },
                childCount: cartItemsList.isNotEmpty ? 4 : 1, // Only two items in the list
              ),
            );
          }
        }
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
