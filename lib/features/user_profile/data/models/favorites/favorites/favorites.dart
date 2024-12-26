import 'links.dart';
import 'meta.dart';
import 'payload.dart';

class Favorites {
  List<Payload>? payload;
  Links? links;
  Meta? meta;
  bool? status;
  int? code;
  dynamic messages;

  Favorites({
    this.payload,
    this.links,
    this.meta,
    this.status,
    this.code,
    this.messages,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
        payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Payload.fromJson(e as Map<String, dynamic>))
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
        'payload': payload?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
        'status': status,
        'code': code,
        'messages': messages,
      };
}
