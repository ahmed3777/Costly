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
    final items = cart.items!;
    
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return   BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
            final isUpdating = state is CartLoading;
              return CartItem(
                productImage: items[index].product!.mediaLinks![0].link,
                productName: items[index].product!.enName,
                totalPrice: items[index].itemTotalPrice,
                onDelete: () async {
                  await context.read<CartCubit>().deleteFromCart(
                      productId: items[index].product!.id,
                      productVariationId: items[index].productVariationId!);
                },
                incrementQuantity: () async {
                  await context.read<CartCubit>().incrementQuantity(
                      productId: items[index].product!.id,
                      productVariationId: items[index].productVariationId!,

                      ) ;
                },
                decrementQuantity: () async {
                  await context.read<CartCubit>().decrementQuantity(
                      productId: items[index].product!.id,
                      productVariationId: items[index].productVariationId!,
                      );},
                quantity: items[index].quantity,
                 isLoading: isUpdating,
              );
            },

          );
        },
        childCount: items.length,
      ),
    );
  }
}