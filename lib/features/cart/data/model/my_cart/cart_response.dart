import 'cart.dart';

class CartResponse {
  Cart? payload;
  bool? status;
  int? code;
  dynamic messages;

  CartResponse({this.payload, this.status, this.code, this.messages});

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        payload: json['payload'] is Map<String, dynamic>
            ? Cart.fromJson(json['payload'])
            : Cart(
                items: []), // Fallback to an empty cart if payload is not a Map
        status: json['status'] as bool?,
        code: json['code'] as int?,
        messages: json['messages'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'payload': payload?.toJson(),
        'status': status,
        'code': code,
        'messages': messages,
      };
}
