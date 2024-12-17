import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item_list.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.scaffoldKey});
    final GlobalKey<ScaffoldState>scaffoldKey; 
  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
 // Accept scaffoldKey as a parameter
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
            CustomHomeAppBar(scaffoldKey: widget.scaffoldKey,
            centerText: "Discover",
            visible: true,
            ),
            SizedBox(height: 1.h,),
           // CategoryItemsList(),
        ],
      ),
    );
  }
}