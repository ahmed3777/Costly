import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});
  static const routeName = 'category';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: CategoryViewBody(scaffoldKey: scaffoldKey),
    ));
  }
}
