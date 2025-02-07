import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String? productImage;
  final String? productName;
  final int? productPrice;
  final int quantity;
  final int? totalPrice;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;
   final VoidCallback onDelete;
   final bool isLoading;
  const CartItem({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.quantity,
     required this.onDelete,
    required this.incrementQuantity,
    required this.decrementQuantity, 
    required this.totalPrice, 
     this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
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
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              productImage!,
              width: 60.0,
              height: 60.0,
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
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '$totalPrice',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 2.0),
                Row(
                  children: [ 
                    isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        :  IconButton(
                      icon: const Icon(Icons.remove, size: 20.0),
                      onPressed: () {
                        if (quantity > 1) {
                           decrementQuantity();
                        }
                      },
                    ),
                    Text(
                      "$quantity",
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                     isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        :  IconButton(
                      icon: const Icon(Icons.add, size: 20.0),
                      
                      onPressed: incrementQuantity,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
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
