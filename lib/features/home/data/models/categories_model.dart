class CategoriesModel {
  final String? id;
  final String? enName;
  final String? arName;
  final String? arSlug;
  final String? enSlug;
  final String? parentId;
  final String? status;
  final String? creatorId;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? nameByLang;
  final String? slugByLang;
  final String? mainMediaUrl;

  CategoriesModel({
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
  });

  // Factory method to convert JSON into a Category object
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    print("Category JSON: $json"); // Debug print to check incoming JSON
    return CategoriesModel(
      id: json['id'] as String?,
      enName: json['en_name'] as String?,
      arName: json['ar_name'] as String?,
      arSlug: json['ar_slug'] as String?,
      enSlug: json['en_slug'] as String?,
      parentId: json['parent_id'] as String?,
      status: json['status'] as String?,
      creatorId: json['creator_id'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      nameByLang: json['name_by_lang'] as String?,
      slugByLang: json['slug_by_lang'] as String?,
      mainMediaUrl: json['main_media_url'] as String?,
    );
  }
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
      };
}
