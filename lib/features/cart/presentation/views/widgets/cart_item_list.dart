import 'package:costly/features/cart/data/model/my_cart/item.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemList extends StatefulWidget {
  const CartItemList({super.key, required this.items});
  final List<Item> items;

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CartItem(
            productImage: widget.items[index].product!.mediaLinks![0].link,
            productPrice:widget.items[index].product!.mainVariation!.priceAfterDiscount,
            productName: widget.items[index].product!.enName,
            onDelete: ()async{
              // Handle delete action
             await context.read<CartCubit>().deleteFromCart(productId: widget.items[index].product!.id, 
              productVariationId: widget.items[index].productVariationId!);
             
              
            },
            
          );
        },
        childCount: widget.items.length,
      ),
    );
  }
}
