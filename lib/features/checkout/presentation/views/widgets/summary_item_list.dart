import 'package:costly/core/helper_functions/show_error_bar.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'summery_item.dart';

class SummaryItemList extends StatelessWidget {
  const SummaryItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      if (state is CartLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is CartSuccess) {
        final cart = state.cart.payload;
        final items = cart.items ?? [];
        return SizedBox(
          height: 154.h, // Adjust the height dynamically
          child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = items[index];
              return SummeryItem(
                name: item.product!.enName,
                price: item.itemTotalPrice.toString(),
                imageUrl: item.product!.mediaLinks![0].link,
              );
            },
          ),
        );
      } else if (state is CartFailure) {
        showErrorBar(context, state.message);
      }
      return Container();
    });
  }
}
