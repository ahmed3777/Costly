import 'delete_item.dart';

class DeleteFromCart {
  DeleteItemFromCard? payload;
  bool? status;
  int? code;
  dynamic messages;

  DeleteFromCart({this.payload, this.status, this.code, this.messages});

  factory DeleteFromCart.fromJson(Map<String, dynamic> json) {
    return DeleteFromCart(
      payload: json['payload'] == null
          ? null
          : DeleteItemFromCard.fromJson(
              json['payload'] as Map<String, dynamic>),
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
