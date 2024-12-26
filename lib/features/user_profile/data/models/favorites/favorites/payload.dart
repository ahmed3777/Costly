import 'favorited.dart';

class Payload {
  String? id;
  String? favoritedType;
  String? favoritedId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  Favorited? favorited;

  Payload({
    this.id,
    this.favoritedType,
    this.favoritedId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.favorited,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json['id'] as String?,
        favoritedType: json['favorited_type'] as String?,
        favoritedId: json['favorited_id'] as String?,
        userId: json['user_id'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        favorited: json['favorited'] == null
            ? null
            : Favorited.fromJson(json['favorited'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'favorited_type': favoritedType,
        'favorited_id': favoritedId,
        'user_id': userId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'favorited': favorited?.toJson(),
      };
}
