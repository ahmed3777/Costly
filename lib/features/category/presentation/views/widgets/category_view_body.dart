import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/category/presentation/views/widgets/category_filter_button.dart';
import 'package:costly/features/products/presentation/views/widgets/vertical_gradel_of_product_card.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  // Accept scaffoldKey as a parameter
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Column(
          children: [
            CustomHomeAppBar(
              scaffoldKey: widget.scaffoldKey,
              centerText: S.of(context).discover,
              visible: true,
            ),
            SizedBox(
              height: 4.h,
            ),
            CategoryFilterButtons(),
            // CategoryItemsList(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
      VerticalGraidelOfProductCard(),
    ]);
  }
}
