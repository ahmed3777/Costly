import 'package:costly/features/cart/data/model/my_cart/item.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.items});
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CartItem(
            productImage: items[index].product!.mediaLinks![0].link,
            productPrice:
                items[index].product!.mainVariation!.priceAfterDiscount,
            productName: items[index].product!.enName,
          );
        },
        childCount: items.length,
      ),
    );
  }
}
