import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/orders/data/model/orders/payload.dart';
import 'package:costly/features/orders/presentation/cubit/cubit/orders_cubit.dart';
import 'package:costly/features/orders/presentation/views/widgets/order_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({
    super.key,
    required this.scaffoldKey,
    required this.orderId,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String orderId;

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

List<Orders>? order = [];

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrdersFailure) {
          return Center(child: Text(state.message));
        } else if (state is OrdersSuccess) {
          order = state.mainOrders.payload;
          if (order == null || order!.isEmpty) {
            return const Center(child: Text("No order found"));
          }
          return _buildOrderDetails(context);
        } else {
          return const Center(child: Text("No order found"));
        }
      },
    );
  }

  Widget _buildOrderDetails(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        CustomHomeAppBar(
          scaffoldKey: widget.scaffoldKey,
          centerText: "ORDER DETAILS",
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Order№",
                            style: TextStyles.regular16.copyWith(
                              color: AppColors.darkPrimaryColor,
                            ),
                          ),
                          TextSpan(
                            text: " ${order![0].invoiceId}",
                            style: TextStyles.regular16.copyWith(
                              color: AppColors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      order![0].createdAt!.split(' ')[0],
                      // Extract only the date part
                      style: TextStyles.regular14.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                // SizedBox(height: 10.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Tracking number: ",
                        style:
                            TextStyles.regular14.copyWith(color: Colors.grey),
                      ),
                      TextSpan(
                        text: "${order![0].invoiceId}",
                        style:
                            TextStyles.regular14.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: 250,
                    child: OrderItemList(
                      order: order,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                OrderInfo(
                  paymentMethod: order![0].paymentMethod!,
                  shippingAddress: order![0].shippingAddressOne!,
                  billingAddress: order![0].shippingAddressOne!,
                  orderStatus: "Delivered",
                  totalAmount: order![0].totalPriceAfterDiscount!,
                ),
              ]),
        ),
      ]),
    );
  }
}

class OrderItemList extends StatelessWidget {
  const OrderItemList({super.key, required this.order});

  final List<Orders>? order;

  @override
  Widget build(BuildContext context) {
    if (order == null || order!.isEmpty) {
      return const Center(child: Text("No order items found."));
    }
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: order![0].items!.length,
      itemBuilder: (context, index) {
        final item = order![0].items![index];
        ;
        return _buildOrderItem(
          imageUrl: item.product?.mediaLinks?.first.link ?? '',
          title: item.product?.enName ?? '',
          sku: item.product?.mainVariation?.priceAfterDiscount.toString() ?? '',
          quantity: item.quantity,
        );
      },
    );
  }
}
Widget _buildOrderItem({
  required String? imageUrl,
  required String title,
  required String sku,
  required int quantity,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product image
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Product details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.regular14,
              ),
              SizedBox(height: 4.h),
              Text(
                sku,
                style: TextStyles.regular14.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    "Quantity: ",
                    style: TextStyles.regular14.copyWith(color: Colors.grey),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyles.regular14,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

