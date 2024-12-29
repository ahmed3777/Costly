import 'package:costly/features/home/data/models/products/main_variation.dart';
import 'package:costly/features/home/data/models/products/product.dart';


class Item {
  String? id;
  int? quantity;
  int? itemTotalPrice;
  dynamic length;
  dynamic chest;
  dynamic waist;
  dynamic hip;
  String? productVariationId;
  String? productId;
  String? cartId;
  String? customerId;
  String? createdAt;
  MainVariation? productVariation;
  Product? product;

  Item({
    this.id,
    this.quantity,
    this.itemTotalPrice,
    this.length,
    this.chest,
    this.waist,
    this.hip,
    this.productVariationId,
    this.productId,
    this.cartId,
    this.customerId,
    this.createdAt,
    this.productVariation,
    this.product,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as String?,
        quantity: json['quantity'] as int?,
        itemTotalPrice: json['item_total_price'] as int?,
        length: json['length'] as dynamic,
        chest: json['chest'] as dynamic,
        waist: json['waist'] as dynamic,
        hip: json['hip'] as dynamic,
        productVariationId: json['product_variation_id'] as String?,
        productId: json['product_id'] as String?,
        cartId: json['cart_id'] as String?,
        customerId: json['customer_id'] as String?,
        createdAt: json['created_at'] as String?,
        productVariation: json['product_variation'] == null
            ? null
            : MainVariation.fromJson(
                json['product_variation'] as Map<String, dynamic>),
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'item_total_price': itemTotalPrice,
        'length': length,
        'chest': chest,
        'waist': waist,
        'hip': hip,
        'product_variation_id': productVariationId,
        'product_id': productId,
        'cart_id': cartId,
        'customer_id': customerId,
        'created_at': createdAt,
        'product_variation': productVariation?.toJson(),
        'product': product?.toJson(),
      };
}
