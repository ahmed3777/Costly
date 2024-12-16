import 'package:costly/features/home/data/models/product_details/child.dart';
import 'package:costly/features/home/data/models/product_details/related_product.dart';

import 'product.dart';
import 'selected_variation.dart';

class Payload {
  SingleProduct? product;
  SelectedVariation? selectedVariation;
  dynamic parent;
  List<Child>? children;
  List<RelatedProduct> relatedProducts;

  Payload({
    this.product,
    this.selectedVariation,
    this.parent,
    this.children,
    required this.relatedProducts,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        product: json['product'] == null
            ? null
            : SingleProduct.fromJson(json['product'] as Map<String, dynamic>),
        selectedVariation: json['selected_variation'] == null
            ? null
            : SelectedVariation.fromJson(
                json['selected_variation'] as Map<String, dynamic>),
        parent: json['parent'] as dynamic,
        children: (json['children'] as List<dynamic>?)?.map((e) => Child.fromJson(e as Map<String, dynamic>)).toList(),
        relatedProducts: (json['relatedProducts'] as List<dynamic>?)!
            .map((e) => RelatedProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'selected_variation': selectedVariation?.toJson(),
        'parent': parent,
        'children': children,
        'relatedProducts': relatedProducts.map((e) => e.toJson()).toList(),
      };
}
