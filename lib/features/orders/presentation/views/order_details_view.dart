import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/orders/presentation/cubit/cubit/orders_cubit.dart';
import 'package:costly/features/orders/presentation/views/widgets/order_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/get_it_services.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderId});
  static const routeName = 'orderDetails';
  final String orderId;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getSingleOrder(orderId),
      child: SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(),
          body: OrderDetailsViewBody(
            scaffoldKey: scaffoldKey,
            orderId: orderId,
          ),
        ),
      ),
    );
  }
}
