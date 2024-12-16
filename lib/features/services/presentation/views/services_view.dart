import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/services/presentation/views/widgets/services_view_body.dart';
import 'package:flutter/material.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});
  static const String routeName = 'ServicesDetailsView';

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: scaffoldKey,
            drawer: CustomDrawer(),
            body: ServicesViewBody(
              scaffoldKey: scaffoldKey,
            )));
  }
}
