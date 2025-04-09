import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String? productImage;
  final String? productName;
  final int quantity;
  final int? totalPrice;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;
  final VoidCallback onDelete;
  const CartItem({
    super.key,
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.onDelete,
    required this.incrementQuantity,
    required this.decrementQuantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              productImage!,
              width: 106,
              height: 101,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName!,
                  style: TextStyles.light13,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text('LE$totalPrice', style: TextStyles.light12),
                const SizedBox(height: 2.0),
                Row(
                  children: [
                  IconButton(
                            icon: const Icon(
                              Icons.remove,
                              size: 12,
                            ),
                            onPressed: () {
                              if (quantity > 1) {
                                decrementQuantity();
                              }
                            },
                          ),
                    Text("$quantity", style: TextStyles.bold18),
                    IconButton(
                            icon: const Icon(Icons.add, size: 12),
                            onPressed: incrementQuantity,
                          ),
                    const Spacer(),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color:Colors.red, // Background color (change if needed)
                        borderRadius:BorderRadius.circular(5), // Rounded corners
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          Assets.imagesIconDelete,
                          width: 20, // Adjust size as needed
                          height: 20,
                          fit: BoxFit
                              .contain, // Ensures it fits well inside the button
                        ),
                        onPressed: onDelete,
                        padding:EdgeInsets.zero, // Removes extra padding around the image
                        constraints:BoxConstraints(), // Prevents unwanted stretching
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
