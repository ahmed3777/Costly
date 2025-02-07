import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewConsumer extends StatelessWidget {
  const CartViewConsumer({super.key, this.onCartUpdated});

  final Function(bool, int)? onCartUpdated;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (previous, current) => current is CartSuccess || current is CartFailure,
      listener: (context, state) {
        if (state is CartSuccess && onCartUpdated != null) {
          final cart = state.cart.payload;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onCartUpdated!(cart.items!.isNotEmpty, cart.totalPrice!);
            print("Cart updated: hasItems=${cart.items!.isNotEmpty}, totalPrice=${cart.totalPrice}");
          });
        }
      },
      builder: (context, state) {
        print("Current State: $state"); // Debugging log

        //  Show Loading Indicator
        if (state is CartLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        //  Handle Failure
        if (state is CartFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.message)),
          );
        }

        // Handle Success
        if (state is CartSuccess) {
          final cart = state.cart.payload;
          final items = cart.items ?? [];

          if (items.isEmpty) {
            print("Cart is empty, showing empty cart image");
            return SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Image.asset(Assets.imagesEmptycart),
                ),
              ),
            );
          } else {
            print("Cart has items, showing CartItemList");
            return CartItemList(cart: cart);
          }
        }

        // Default Case (should not happen)
        return const SliverToBoxAdapter(
          child: Center(child: Text("Unexpected State")),
        );
      },
    );
  }
}
