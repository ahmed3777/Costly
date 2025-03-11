import 'package:costly/features/cart/data/model/my_cart/cart.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemList extends StatelessWidget {
  final Cart cart;
  const CartItemList({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final cartItems = cart.items ?? [];
    return ListView.builder(
      shrinkWrap: true, // ✅ Ensures it doesn't take full height
      physics: NeverScrollableScrollPhysics(), // ✅ Prevents scrolling conflicts
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final isUpdating = state is CartLoading;
            return CartItem(
              productImage: cartItems[index].product!.mediaLinks![0].link,
              productName: cartItems[index].product!.enName,
              totalPrice: cartItems[index].itemTotalPrice,
              onDelete: () async {
                await context.read<CartCubit>().deleteFromCart(
                  productId: cartItems[index].product!.id,
                  productVariationId: cartItems[index].productVariationId!,
                );
              },
              incrementQuantity: () async {
                await context.read<CartCubit>().incrementQuantity(
                  productId: cartItems[index].product!.id,
                  productVariationId: cartItems[index].productVariationId!,
                );
              },
              decrementQuantity: () async {
                await context.read<CartCubit>().decrementQuantity(
                  productId: cartItems[index].product!.id,
                  productVariationId: cartItems[index].productVariationId!,
                );
              },
              quantity: cartItems[index].quantity,
              isLoading: isUpdating,
            );
          },
        );
      },
    );
  }
}
