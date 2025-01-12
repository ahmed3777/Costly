import 'package:costly/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.productImage, required this.productName, required this.productPrice, this.onDelete});
final String? productImage;
final String? productName;
final int? productPrice;
  final Function? onDelete;
  @override
  Widget build(BuildContext context) {
    return  SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CartItem(
          productImage: productImage ,
          productName: productName,
          productPrice: productPrice,
          onDelete: onDelete,
        );
      },
      
    );
  }
}