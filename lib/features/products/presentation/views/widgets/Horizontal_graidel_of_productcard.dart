import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/features/products/presentation/views/widgets/product_card.dart';
import 'package:costly/features/products/data/models/product_details/related_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalListOfProductCard extends StatelessWidget {
  const HorizontalListOfProductCard({
    super.key,
    required this.relatedProduct,
    this.isLoading = false,
  });

  final List<RelatedProduct> relatedProduct;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // Fake data for loading state
    final dummyList = List.generate(
      6,
      (index) => RelatedProduct(
        id: '',
        arName: '',
        enName: '',
        mediaLinks: [],
        mainVariation: null,
      ),
    );

    final listToShow = isLoading ? dummyList : relatedProduct;

    return SizedBox(
      height: 235.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listToShow.length,
        itemBuilder: (context, index) {
          final item = listToShow[index];

          String title = isArabic() ? item.arName : item.enName;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Skeletonizer(
              enabled: isLoading,
              child: ProductCard(
                isLoading: isLoading,
                productId: item.id,
                productVariationId: item.mainVariation?.id ?? '',
                mediaLinks: item.mediaLinks,
                title: title,
                salePrice: item.mainVariation?.priceAfterDiscount ?? 0,
                originalPrice: item.mainVariation?.price ?? 0,
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
      ),
    );
  }
}
