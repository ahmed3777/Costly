
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/orders/presentation/cubit/cubit/orders_cubit.dart';
import 'package:costly/features/orders/presentation/views/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_card_item_view.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeAppBar(
          scaffoldKey: scaffoldKey,
          centerText: "ORDERS",
        ),
        Expanded(
          child: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              if (state is OrdersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is OrdersFailure) {
                return Center(child: Text(state.message));
              } else if (state is OrdersSuccess) {
                // For demo purposes, we'll create a list of sample orders
                 final orders = state.mainOrders.payload;
                 return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return OrderCard(
                      orderId: order.id!,
                      date: order.createdAt!,
                      trackingNumber: order.invoiceId,
                      totalAmount: order.totalPriceAfterDiscount.toString(),
                      status: "Delivered",
                      onDetailsTap: () {
                        Navigator.pushNamed(
                          context,
                          OrderDetailsView.routeName,
                          arguments: order.id,
                        );
                      }, quantity:4,
                    );
                  },
                );
              } 
              return const Center(child: Text("No orders found"));
            },
          ),
        ),
      ],
    );
  }
}