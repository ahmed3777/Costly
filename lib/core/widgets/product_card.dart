import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/home/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int? salePrice;
  final int? originalPrice;
  final String productId;
  final String? productVariationId;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.salePrice,
    required this.productId,
    this.productVariationId,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Use the screen width for dynamic sizing
    double cardWidth = screenWidth * 0.45; // 45% of the screen width
    double cardHeight = screenHeight * 0.35; // 35% of the screen height

    double imageHeight = cardHeight * 0.7; // Image takes up 70% of card height

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsView.routeName, arguments: {
          'productId': productId,
          'productVariationId': productVariationId
        });
      },
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, // Default background color if needed
        ),
        child: Stack(
          children: [
            // Product image with gradient background
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: cardWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  color: Color(
                      0xFFC4C4C4), // Default background if image loading fails
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl.isNotEmpty
                        ? imageUrl
                        : "fallback_image_url"), // Fallback URL if empty
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Sale tag (e.g., Sale, New, etc.)
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                width: 40,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Center(
                  child: Text(
                    'Sale',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 8,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Color(0xFF7DCEDB),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Center(
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: SvgPicture.asset(Assets.imagesCart),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 2.55,
              top: imageHeight + 10, // Adjust based on image height
              child: SizedBox(
                width: cardWidth * 0.8, // Title width relative to card width
                child: Text(
                  title,
                  style: TextStyles.light14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            // Price section (current price and original price with strikethrough)
            Positioned(
              left: 2.55,
              top: imageHeight + 30, // Adjust based on image height
              child: SizedBox(
                width: cardWidth,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "LE $salePrice",
                        style: TextStyles.light12.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                          text: "(LE $originalPrice)",
                          style: TextStyles.light12.copyWith(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red)),
                    ],
                  ),
                ),
              ),
            ),
            // Title of the product (e.g., T-Shirt name)
            // Cart button (icon with a shadow)
          ],
        ),
      ),
    );
  }
}
