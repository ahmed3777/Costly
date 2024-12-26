import 'package:costly/features/home/presentation/cubits/product/single_product/singleproduct_cubit.dart';
import 'package:costly/features/home/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBlocBuilder extends StatefulWidget {
  const ProductDetailsBlocBuilder({super.key, required this.productId, required this.productVariationId});
  final String productId;
  final String productVariationId;

  @override
  State<ProductDetailsBlocBuilder> createState() => _ProductDetailsBlocBuilderState();
}


class _ProductDetailsBlocBuilderState extends State<ProductDetailsBlocBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SingleproductCubit>().getSingleProduct(widget.productId, widget.productVariationId);
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SingleproductCubit, SingleproductState>(
      
        builder: (context, state) {
      if (state is SingleproductLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is SingleproductFailure) {
        return Center(child: Text(state.errMessage));
      }
      if (state is SingleproductSuccess) {
        return ProductDetailsViewBody(productDetails: state.singleProduct);
      }
      return const Center(child: Text("No products available"));
    });
  }
} 
