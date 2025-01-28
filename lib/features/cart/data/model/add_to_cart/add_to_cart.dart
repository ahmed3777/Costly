class AddToCart {
  String? productId;
  String? productVariationId;
  int? quantity;

  AddToCart({this.productId, this.productVariationId, this.quantity});

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
        productId: json['product_id'] as String?,
        productVariationId: json['product_variation_id'] as String?,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'product_variation_id': productVariationId,
        'quantity': quantity,
      };
}
