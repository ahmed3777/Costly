import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/home/presentation/cubits/product/single_product/singleproduct_cubit.dart';
import 'package:costly/features/home/presentation/views/widgets/product_details_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView(
      {super.key, required this.productId, required this.productVariationId});

  static const routeName = '/product_details';
  final String? productId;
  final String? productVariationId;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        body: BlocProvider(
          create: (context) => getIt.get<SingleproductCubit>()
            ..getSingleProduct(widget.productId!, widget.productVariationId!),
          child: ProductDetailsBlocBuilder(),
        ),
      ),
    );
  }
}
