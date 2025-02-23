import 'pivot.dart';

class Category {
  String? id;
  String? enName;
  String? arName;
  String? arSlug;
  String? enSlug;
  dynamic parentId;
  String? status;
  String? creatorId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? nameByLang;
  String? slugByLang;
  String? mainMediaUrl;
  Pivot? pivot;
  dynamic parent;

  Category({
    this.id,
    this.enName,
    this.arName,
    this.arSlug,
    this.enSlug,
    this.parentId,
    this.status,
    this.creatorId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.nameByLang,
    this.slugByLang,
    this.mainMediaUrl,
    this.pivot,
    this.parent,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as String?,
        enName: json['en_name'] as String?,
        arName: json['ar_name'] as String?,
        arSlug: json['ar_slug'] as String?,
        enSlug: json['en_slug'] as String?,
        parentId: json['parent_id'] as dynamic,
        status: json['status'] as String?,
        creatorId: json['creator_id'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        nameByLang: json['name_by_lang'] as String?,
        slugByLang: json['slug_by_lang'] as String?,
        mainMediaUrl: json['main_media_url'] as String?,
        pivot: json['pivot'] == null
            ? null
            : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
        parent: json['parent'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'en_name': enName,
        'ar_name': arName,
        'ar_slug': arSlug,
        'en_slug': enSlug,
        'parent_id': parentId,
        'status': status,
        'creator_id': creatorId,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'name_by_lang': nameByLang,
        'slug_by_lang': slugByLang,
        'main_media_url': mainMediaUrl,
        'pivot': pivot?.toJson(),
        'parent': parent,
      };
}
