import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/features/products/presentation/views/widgets/product_card.dart';
import 'package:costly/features/products/data/models/product_details/related_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalListOfProductCard extends StatelessWidget {
  const HorizontalListOfProductCard({super.key, required this.relatedProduct});

  final List<RelatedProduct> relatedProduct;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal, // Scroll horizontally
        itemCount: relatedProduct.length,
        itemBuilder: (context, index) {
          // Ensure valid names and handle fallback for null or empty values
          String title = isArabic()
              ? relatedProduct[index].arName
              : relatedProduct[index].enName;
          return ProductCard(
            productId: relatedProduct[index].id,
            productVariationId: relatedProduct[index].mainVariation?.id ?? '',
            mediaLinks: relatedProduct[index].mediaLinks ,
            // imageUrl: relatedProduct[index].mediaLinks?.isNotEmpty == true
            //     ? relatedProduct[index].mediaLinks![0].link
            //     : Assets.imagesBag,
            // Replace with an actual fallback image URL
            title: title,
            salePrice:
                relatedProduct[index].mainVariation?.priceAfterDiscount ?? 0,
            originalPrice: relatedProduct[index].mainVariation?.price ??
                0, // Use dynamic value for originalPrice if available
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
