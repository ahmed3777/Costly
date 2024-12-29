import 'cart.dart';

class CartResponse {
  Cart? payload;
  bool? status;
  int? code;
  dynamic messages;

  CartResponse({this.payload, this.status, this.code, this.messages});

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        payload: json['payload'] == null
            ? null
            : Cart.fromJson(json['payload'] as Map<String, dynamic>),
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
