import 'package:carousel_slider/carousel_slider.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/products/data/models/products/media_link.dart';
import 'package:costly/features/products/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/add_to_cart_button.dart';

class ProductCard extends StatelessWidget {
  final List<MediaLink>? mediaLinks;
  final String title;
  final int? salePrice;
  final int? originalPrice;
  final String productId;
  final String? productVariationId;
  final bool isLoading;
  const ProductCard({
    super.key,
    required this.mediaLinks,
    required this.title,
    required this.salePrice,
    required this.productId,
    this.productVariationId,
    this.originalPrice,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsiveness
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    // Use the screen width for dynamic sizing
    double cardWidth = screenWidth * 0.45; // 45% of the screen width
    double cardHeight = screenHeight * 0.35; // 35% of the screen height

    double imageHeight = cardHeight * 0.7; // Image takes up 70% of card height

    return GestureDetector(
      onTap: () {
        if (productVariationId != null) {
          Navigator.pushNamed(context, ProductDetailsView.routeName,
              arguments: {
                'productId': productId,
                'productVariationId': productVariationId
              });
        } else {
          print('Invalid product or variation ID');
        }
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
                ),
                child: mediaLinks != null && mediaLinks!.isNotEmpty
                    ? CarouselSlider(
                        options: CarouselOptions(
                          height: imageHeight,
                          autoPlay: false,
                          enableInfiniteScroll: false,
                          viewportFraction: 1.0,
                        ),
                        items: mediaLinks!.map((mediaLink) {
                          return Container(
                            width: cardWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(mediaLink.link ??
                                    'https://costly.mix-code.com/storage/5/beach-2_a122bd1ba7611a9dd03c8f59077830a4.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    : Center(child: Text('No images available')),
              ),
            ),

            // Sale tag (e.g., Sale, New, etc.)
            if (!isLoading)
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
                child: AddToCartButton(
                  productId: productId,
                  productVariationId: productVariationId ?? '',
                )),
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
          ],
        ),
      ),
    );
  }
}
