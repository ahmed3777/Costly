
import 'package:costly/features/products/data/models/product_details/payload.dart';

class ProductDetails {
  Payload? payload;
  bool? status;
  int? code;
  dynamic messages;

  ProductDetails({this.payload, this.status, this.code, this.messages});

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      payload: json['payload'] == null
          ? null
          : Payload.fromJson(json['payload'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
      messages: json['messages'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'payload': payload?.toJson(),
        'status': status,
        'code': code,
        'messages': messages,
      };
}
