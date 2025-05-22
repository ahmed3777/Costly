import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'widgets/filter_view_body.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  static const String routeName = 'filter';
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
        body: FilterViewBody(
          scaffoldKey: scaffoldKey,
        ),
      ),
    );
  }
}
