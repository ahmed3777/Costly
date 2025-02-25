import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/products/presentation/cubit/product/product_cubit.dart';
import 'package:costly/features/products/presentation/views/widgets/products_by_category_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsByCategoryView extends StatelessWidget {
  const ProductsByCategoryView({super.key, required this.categoryId});
  final String categoryId;
  static const routeName = 'productsByCategoryView';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) =>
          getIt<ProductCubit>()..getProductsByCategory(categoryId: categoryId),
      child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
        body: ProductsByCategoryViewBody(
          scaffoldKey: scaffoldKey,
          categoryId: categoryId,
        ),
      ),
    );
  }
}
