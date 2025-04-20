import 'item.dart';

class Cart {
  String? id;
  int? totalPrice;
  String? customerId;
  String? createdAt;
  List<Item> items;

  Cart({
    this.id,
    this.totalPrice,
    this.customerId,
    this.createdAt,
    required this.items,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['id'] as String?,
        totalPrice: json['total_price'] as int?,
        customerId: json['customer_id'] as String?,
        createdAt: json['created_at'] as String?,
        items: (json['items'] as List<dynamic>?)!
            .map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  factory Cart.fromJsonList(List<dynamic>? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return Cart(items: []); // Return an empty list of items
    }

    return Cart(
      items: jsonList
          .where((e) => e != null) // Filter out null entries
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'total_price': totalPrice,
        'customer_id': customerId,
        'created_at': createdAt,
        'items': items.map((e) => e.toJson()).toList(),
      };
}
