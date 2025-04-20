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
    final cartItems = cart.items;
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final item = cartItems[index];
            return CartItem(
              productImage: item.product?.mediaLinks?.isNotEmpty == true
                  ? item.product!.mediaLinks![0].link
                  : 'placeholder_image_url',
              productName: item.product?.enName ?? 'Unknown Product',
              totalPrice: item.itemTotalPrice,
              quantity: item.quantity,
              onDelete: () async {
                if (item.product?.id != null &&
                    item.productVariationId != null) {
                  await context.read<CartCubit>().deleteFromCart(
                        productId: item.product!.id,
                        productVariationId: item.productVariationId!,
                      );
                }
              },
              incrementQuantity: () async {
                if (item.product?.id != null &&
                    item.productVariationId != null) {
                  await context.read<CartCubit>().incrementQuantity(
                        productId: item.product!.id,
                        productVariationId: item.productVariationId!,
                      );
                }
              },
              decrementQuantity: () async {
                if (item.product?.id != null &&
                    item.productVariationId != null) {
                  await context.read<CartCubit>().decrementQuantity(
                        productId: item.product!.id,
                        productVariationId: item.productVariationId!,
                      );
                }
              },
            );
          },
        );
      },
    );
  }
}
