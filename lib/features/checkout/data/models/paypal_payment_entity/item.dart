import 'package:costly/features/cart/data/model/my_cart/item.dart';


class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  factory ItemEntity.fromEntity(Item itemEntity) {
    return ItemEntity(
      name: itemEntity.product!.enName,
      quantity: itemEntity.quantity,
      price: itemEntity.productVariation!.price.toString(),
      currency: "USD ",
    );
  }
}