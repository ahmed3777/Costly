import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/category/presentation/views/widgets/category_filter_button.dart';
import 'package:costly/features/products/presentation/views/widgets/vertical_gradel_of_product_card.dart';
import 'package:costly/generated/l10n.dart';
import 'package:costly/features/products/presentation/cubit/product/product_cubit.dart';
import 'package:costly/features/filter/presentation/views/filter_view.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  Future<void> _handleFilterPressed(BuildContext context) async {
    final filters = await Navigator.pushNamed(
      context,
      FilterView.routeName,
    ) as Map<String, dynamic>?;

    if (filters != null && context.mounted) {
      context.read<ProductCubit>().filterProduct(
            priceFrom: filters['minPrice']?.toInt(),
            priceTo: filters['maxPrice']?.toInt(),
            selectedBrands: filters['brands'],
            selectedCategoryis: filters['categoriesID'],
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        // App Bar Section
        SliverToBoxAdapter(
          child: CustomHomeAppBar(
            scaffoldKey: widget.scaffoldKey,
            centerText: S.of(context).discover,
            visibleNotification: true,
            visibleFilter: true,
            onFilterPressed: () => _handleFilterPressed(context),
          ),
        ),

        // Filter Buttons Section
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 8.h),
                const CategoryFilterButtons(),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),

        // Main Products Grid
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          sliver: const VerticalGraidelOfProductCard(),
        ),

        // Bottom Padding
        SliverToBoxAdapter(
          child: SizedBox(height: 24.h),
        ),
      ],
    );
  }
}
