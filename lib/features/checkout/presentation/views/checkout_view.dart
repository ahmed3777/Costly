import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = 'checkout';
  @override
  Widget build(BuildContext context) {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: CheckoutViewBody(scaffoldKey: scaffoldKey),
    ));
  }
}