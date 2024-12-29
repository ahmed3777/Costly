import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

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
      child: Scaffold(
        key: scaffoldKey,
        body: CartViewBody(scaffoldKey: scaffoldKey),
        drawer: CustomDrawer(),
      ),
    );
  }
}
