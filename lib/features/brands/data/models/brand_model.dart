class BrandModel {
  final String id;
  final String enName;
  final String arName;
  final String arSlug;
  final String enSlug;
  final String status;
  final String creatorId;
  final String? deletedAt;
  final String createdAt;
  final String updatedAt;
  final String nameByLang;
  final String slugByLang;
  final String mainMediaUrl;

  BrandModel({
    required this.id,
    required this.enName,
    required this.arName,
    required this.arSlug,
    required this.enSlug,
    required this.status,
    required this.creatorId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.nameByLang,
    required this.slugByLang,
    required this.mainMediaUrl,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] as String,
      enName: json['en_name'] as String,
      arName: json['ar_name'] as String,
      arSlug: json['ar_slug'] as String,
      enSlug: json['en_slug'] as String,
      status: json['status'] as String,
      creatorId: json['creator_id'] as String,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      nameByLang: json['name_by_lang'] as String,
      slugByLang: json['slug_by_lang'] as String,
      mainMediaUrl: json['main_media_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'en_name': enName,
      'ar_name': arName,
      'ar_slug': arSlug,
      'en_slug': enSlug,
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
}
