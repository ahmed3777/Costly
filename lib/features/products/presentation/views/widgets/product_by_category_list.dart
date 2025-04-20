import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/features/products/data/models/products/main_variation.dart';
import 'package:costly/features/products/data/models/products/product.dart';
import 'package:costly/features/products/presentation/views/widgets/product_card.dart';
import 'package:costly/features/products/presentation/cubit/product/product_cubit.dart';
import 'package:costly/features/products/presentation/cubit/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductByCategoryList extends StatelessWidget {
  const ProductByCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>
    (builder: (context, state) {
          bool isLoading = false;
           List<Product>? productList = [];
      if (state is ProductLoading) {
        isLoading = true;
        // Fake list of products to match layout
        productList = dummyProducts();
      }
   else if (state is ProductFailure) {
        return SliverToBoxAdapter(
          child: Center(child: Text(state.errMessage)),
        );
      }
      else if (state is ProductsByCategorySuccess) {
        productList = state.products.product??[];
      }
        // Handle case when the products list is null or empty
        if (productList.isEmpty) {
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
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: (8.0)),
                child: Skeletonizer(
                  enabled: isLoading,
                  child: ProductCard(
                      isLoading: false,
                    productId: productList![index].id,
                    productVariationId: productList[index].mainVariation!.id,
                    mediaLinks: productList[index].mediaLinks,
                    title: isArabic()
                        ? productList[index].arName
                        : productList[index].enName,
                    salePrice: productList[index].mainVariation!.priceAfterDiscount,
                    originalPrice: productList[index].mainVariation!.price,
                  ),
                ),
              );
            });
    });
  }
   
   List<Product> dummyProducts() {
    return List.generate(
           6,(index) => Product(
            id :"",
            enName: "",
            arName: "",
            arSlug:"",
            enSlug:"",
            mainVariationPrice: 0,
            status: "", creatorId: '', 
            mainMediaUrl: '',
            mainVariation: MainVariation(
            id: '',
            price: 0,
            priceAfterDiscount: 0,
    // باقي الخصائص لو في، حسب ما يتطلب الموديل
  ),
          ),
        );
  }

}
