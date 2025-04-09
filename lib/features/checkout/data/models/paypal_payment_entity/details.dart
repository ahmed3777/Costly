
import 'package:costly/features/cart/data/model/my_cart/cart.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory DetailsEntity.fromEntity(Cart entity) => DetailsEntity(
        subtotal:  entity.totalPrice.toString(),
        shipping: "0",
        shippingDiscount: 0,
      );
}
