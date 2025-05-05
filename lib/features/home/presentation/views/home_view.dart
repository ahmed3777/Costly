import 'package:costly/core/helper_functions/show_error_bar.dart';
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
  DateTime? _lastBackPressed;

  Future<bool> _onWillPop() async {
    if (_lastBackPressed == null || 
        DateTime.now().difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      // First back press
      _lastBackPressed = DateTime.now();
      showErrorBar(context, 'Press back again to exit');
      return false;
    }
    // Second back press within 2 seconds
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) return;
          final shouldPop = await _onWillPop();
          if (shouldPop && context.mounted) {
            Navigator.of(context).pop();
          }
        },
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