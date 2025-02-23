import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/category/presentation/views/widgets/product_by_category_list.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsByCategoryViewBody extends StatefulWidget {
  const ProductsByCategoryViewBody({super.key, required this.scaffoldKey, required this.categoryId});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String categoryId;
  @override
  State<ProductsByCategoryViewBody> createState() => _ProductsByCategoryViewBodyState();
}
class _ProductsByCategoryViewBodyState extends State<ProductsByCategoryViewBody> {
  @override
  Widget build(BuildContext context) {
    // initState() {
    //   super.initState();
    //   context.read<ProductCubit>().getProductsByCategory(categoryId:widget.categoryId);
    //   }
   return CustomScrollView(
     slivers: [
       SliverToBoxAdapter(
        child: Column(
          children: [
            CustomHomeAppBar(
              scaffoldKey: widget.scaffoldKey,
              centerText: S.of(context).discover,
                visible: false,
            ),
            SizedBox(height: 4.h),

          ],
        ),
      ),
         ProductByCategoryList(),
    ]);
  }
}