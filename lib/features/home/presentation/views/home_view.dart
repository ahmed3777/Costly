import 'package:costly/core/widgets/custom_Navigation_bar.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(),
          body: CustomNavigationBar(
            scaffoldKey: scaffoldKey,
          ),
        ),
      ),
    );
  }
}
