import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewConsumer extends StatelessWidget {
  const CartViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()));
        }
        if (state is CartFailure) {
          return SliverFillRemaining(child: Center(child: Text(state.message)));
        }
        if (state is CartSuccess) {
          final items = state.cart.payload?.items ?? [];
          if (items.isEmpty) {
            // Use SliverFillRemaining for empty cart state
            return SliverFillRemaining(
              child: Center(
                child: SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Image.asset(Assets.imagesEmptycart),
                ),
              ),
            );
          }
          // Use SliverList to display cart items
          return CartItemList(
            items: items,
          );
        }
        // Default state: Use SliverFillRemaining
        return const SliverFillRemaining(
          child: SizedBox(),
        );
      },
    );
  }
}
