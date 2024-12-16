import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/widgets/product_card.dart';
import 'package:costly/features/home/data/models/product_details/related_product.dart';
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
          return // Add space between cards
              ProductCard(
            productId: relatedProduct[index].id,
            imageUrl: relatedProduct[index].mediaLinks![0].link ??
                '', // Replace with an actual fallback image URL
            title: title,
            salePrice: relatedProduct[index].mainVariation!.priceAfterDiscount,
            originalPrice: relatedProduct[index]
                .mainVariation!
                .price, // Use dynamic value for originalPrice if available
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