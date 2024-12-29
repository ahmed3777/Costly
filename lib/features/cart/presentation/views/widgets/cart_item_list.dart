import 'package:costly/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CartItem(
          productImage: 'assets/images/costly.png',
          productName: 'Bag',
          productPrice: 100,
        );
      },
    );
  }
}
