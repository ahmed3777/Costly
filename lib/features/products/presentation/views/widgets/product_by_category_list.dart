import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/features/products/data/models/products/product.dart';
import 'package:costly/features/products/presentation/views/widgets/product_card.dart';
import 'package:costly/features/products/presentation/cubit/product/product_cubit.dart';
import 'package:costly/features/products/presentation/cubit/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductByCategoryList extends StatelessWidget {
  const ProductByCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoading) {
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      }
      if (state is ProductFailure) {
        return SliverToBoxAdapter(
          child: Center(child: Text(state.errMessage)),
        );
      }
      if (state is ProductsByCategorySuccess) {
        List<Product>? product = state.products.product;
        // Handle case when the products list is null or empty
        if (product == null || product.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("No products available")),
          );
        }
        return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
              mainAxisSpacing: 0.4,
              crossAxisSpacing: 0.4,
            ),
            itemCount: product.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: (8.0)),
                child: ProductCard(
                  productId: product[index].id,
                  productVariationId: product[index].mainVariation!.id,
                  mediaLinks: product[index].mediaLinks,
                  title: isArabic()
                      ? product[index].arName
                      : product[index].enName,
                  salePrice: product[index].mainVariation!.priceAfterDiscount,
                  originalPrice: product[index].mainVariation!.price,
                ),
              );
            });
      }
      return const SliverToBoxAdapter(
        child: Center(child: Text("No Data")),
      );
    });
  }
}
