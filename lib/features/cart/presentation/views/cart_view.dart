import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit/cart_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  static const routeName = 'cart';
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<CartCubit>()..getCart(),
        child: Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(),
          body: CartViewBody(scaffoldKey: scaffoldKey),
        ),
      ),
    );
  }
}
