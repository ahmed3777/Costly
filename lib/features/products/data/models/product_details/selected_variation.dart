import 'color.dart';

class SelectedVariation {
  String? id;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? productId;
  String? colorId;
  dynamic classificationId;
  String? createdAt;
  String? updatedAt;
  dynamic fabricId;
  bool? isInCart;
  Color? color;
  dynamic classification;
  dynamic fabric;

  SelectedVariation({
    this.id,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.productId,
    this.colorId,
    this.classificationId,
    this.createdAt,
    this.updatedAt,
    this.fabricId,
    this.isInCart,
    this.color,
    this.classification,
    this.fabric,
  });

  factory SelectedVariation.fromJson(Map<String, dynamic> json) {
    return SelectedVariation(
      id: json['id'] as String?,
      price: json['price'] as int?,
      priceAfterDiscount: json['price_after_discount'] as int?,
      quantity: json['quantity'] as int?,
      productId: json['product_id'] as String?,
      colorId: json['color_id'] as String?,
      classificationId: json['classification_id'] as dynamic,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      fabricId: json['fabric_id'] as dynamic,
      isInCart: json['is_in_cart'] as bool?,
      color: json['color'] == null ? null : Color.fromJson(json['color']),
      classification: json['classification'] as dynamic,
      fabric: json['fabric'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'price_after_discount': priceAfterDiscount,
        'quantity': quantity,
        'product_id': productId,
        'color_id': colorId,
        'classification_id': classificationId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'fabric_id': fabricId,
        'is_in_cart': isInCart,
        'color': color?.toJson(),
        'classification': classification,
        'fabric': fabric,
      };
}
