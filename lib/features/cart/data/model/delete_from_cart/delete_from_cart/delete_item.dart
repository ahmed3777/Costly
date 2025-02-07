class DeleteItemFromCard {
  String? id;
  int? totalPrice;
  String? customerId;
  String? createdAt;
  List<dynamic>? items;

  DeleteItemFromCard({
    this.id,
    this.totalPrice,
    this.customerId,
    this.createdAt,
    this.items,
  });

  factory DeleteItemFromCard.fromJson(Map<String, dynamic> json) =>
      DeleteItemFromCard(
        id: json['id'] as String?,
        totalPrice: json['total_price'] as int?,
        customerId: json['customer_id'] as String?,
        createdAt: json['created_at'] as String?,
        items: json['items'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'total_price': totalPrice,
        'customer_id': customerId,
        'created_at': createdAt,
        'items': items,
      };
}
