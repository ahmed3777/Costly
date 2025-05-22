import '../../../../products/data/models/products/links.dart';
import '../../../../products/data/models/products/meta.dart';
import 'payload.dart';

class MainOrders {
  List<Orders>? payload;
  Links? links;
  Meta? meta;
  bool? status;
  int? code;
  dynamic messages;

  MainOrders({
    this.payload,
    this.links,
    this.meta,
    this.status,
    this.code,
    this.messages,
  });

  factory MainOrders.fromJson(Map<String, dynamic> json) {
    final payloadData = json['payload'];
    List<Orders>? parsedPayload;

    if (payloadData is List) {
      parsedPayload = payloadData
          .map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (payloadData is Map<String, dynamic>) {
      parsedPayload = [Orders.fromJson(payloadData)];
    } else {
      parsedPayload = null;
    }

    return MainOrders(
      payload: parsedPayload,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
      messages: json['messages'],
    );
  }

  Map<String, dynamic> toJson() => {
    'payload': payload?.map((e) => e.toJson()).toList(),
    'links': links?.toJson(),
    'meta': meta?.toJson(),
    'status': status,
    'code': code,
    'messages': messages,
  };
}
