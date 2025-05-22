import 'data.dart';

class NotificationPayload {
  String? id;
  String? type;
  String? notifiableType;
  String? notifiableId;
  Data? data;
  dynamic readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationPayload({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationPayload.fromJson(Map<String, dynamic> json) =>
      NotificationPayload(
        id: json['id'] as String?,
        type: json['type'] as String?,
        notifiableType: json['notifiable_type'] as String?,
        notifiableId: json['notifiable_id'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        readAt: json['read_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'notifiable_type': notifiableType,
        'notifiable_id': notifiableId,
        'data': data?.toJson(),
        'read_at': readAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
