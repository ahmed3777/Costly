import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/orders/presentation/cubit/cubit/orders_cubit.dart';
import 'package:costly/features/orders/presentation/views/widgets/order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const routeName = 'order';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getOrders(),
      child: SafeArea(
        child: Scaffold(
            key: scaffoldKey, drawer: CustomDrawer(),
             body: OrderViewBody( scaffoldKey: scaffoldKey,)),
      ),
    );
  }
}
