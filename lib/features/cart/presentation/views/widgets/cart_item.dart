import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String? productImage;
  final String? productName;
  final int? productPrice;
  final Function? onDelete; // Callback for delete action

  const CartItem({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    this.onDelete,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.productPrice! * quantity;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              widget.productImage!,
              width: 60.0,
              height: 60.0,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12.0),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName!,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 2.0),
                Row(
                  children: [
                    // Subtract Button
                    IconButton(
                      icon: const Icon(Icons.remove, size: 20.0),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    // Quantity Display
                    Text(
                      "$quantity", // Display updated price
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    // Add Button
                    IconButton(
                      icon: const Icon(Icons.add, size: 20.0),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        if (widget.onDelete != null) {
                          widget.onDelete!(); // Call delete callback
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Delete Button
        ],
      ),
    );
  }
}
