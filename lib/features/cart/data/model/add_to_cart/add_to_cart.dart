class AddToCart {
  String? productId;
  String? productVariationId;
  int? quantity;
  int?lenght;
  int?chest;
  int?waist;
  int?hip;

  AddToCart({this.productId, this.productVariationId, this.quantity,this.lenght,this.chest,this.waist,this.hip});

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
        productId: json['product_id'] as String?,
        productVariationId: json['product_variation_id'] as String?,
        quantity: json['quantity'] as int?,
        lenght: json['lenght'] as int?,
        chest: json['chest'] as int?,
        waist: json['waist'] as int?,
        hip: json['hip'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'product_variation_id': productVariationId,
        'quantity': quantity,
        'lenght':lenght,
        'chest':chest,
        'waist':waist,
        'hip':hip
      };
}
