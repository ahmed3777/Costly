import 'package:costly/features/home/data/models/products/product.dart';

import 'links.dart';
import 'meta.dart';

class MainProductsResponse {
  List<Product>? product;
  Links? links;
  Meta? meta;
  bool? status;
  int? code;
  dynamic messages;

  MainProductsResponse({
    this.product,
    this.links,
    this.meta,
    this.status,
    this.code,
    this.messages,
  });

  factory MainProductsResponse.fromJson(Map<String, dynamic> json) =>
      MainProductsResponse(
        product: (json['payload'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        status: json['status'] as bool?,
        code: json['code'] as int?,
        messages: json['messages'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'payload': product?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
        'status': status,
        'code': code,
        'messages': messages,
      };
}
