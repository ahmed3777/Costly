class Pivot {
  String? productId;
  String? categoryId;

  Pivot({this.productId, this.categoryId});

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json['product_id'] as String?,
        categoryId: json['category_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'category_id': categoryId,
      };
}
