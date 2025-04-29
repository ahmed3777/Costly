import 'package:costly/core/helper_functions/dummy_products_list.dart';
import 'package:costly/core/helper_functions/show_error_bar.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/products/data/models/products/product.dart';
import 'package:costly/features/products/presentation/views/product_details_view.dart';
import 'package:costly/features/search/presentation/cubit/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearshResultList extends StatelessWidget {
  const SearshResultList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<Product> searchResult = [];
    bool isLoading = false;
    
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchLoading) {
          isLoading = true;
          searchResult = dummyProducts();
        }
        else if (state is SearchFailure) {
          showErrorBar(context, state.message);
        }
        else if (state is SearchSuccess) {
          searchResult = state.mainProductsResponse.product ?? [];
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Skeletonizer(
            enabled: isLoading,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context, 
                        ProductDetailsView.routeName,
                        arguments: {
                          'productId': searchResult[index].id,
                          'productVariationId': searchResult[index].mainVariation!.id,
                        }
                      );
                    },
                    child: Text(
                      searchResult[index].enName,
                      style: TextStyles.regular14,
                    ),
                  ),
                );
              },
              itemCount: searchResult.length, 
            ),
          ),
        );
      },
    );
  }
}
