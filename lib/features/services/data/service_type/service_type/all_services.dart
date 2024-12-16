class AllServices {
  final String id;
  final String enName;
  final String arName;
  final String arSlug;
  final String enSlug;
  final String status;
  final String creatorId;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String nameByLang;
  final String slugByLang;
  final String mainMediaUrl;

  AllServices({
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

  factory AllServices.fromJson(Map<String, dynamic> json) {
    return AllServices(
      id: json['id'],
      enName: json['en_name'],
      arName: json['ar_name'],
      arSlug: json['ar_slug'],
      enSlug: json['en_slug'],
      status: json['status'],
      creatorId: json['creator_id'],
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      nameByLang: json['name_by_lang'],
      slugByLang: json['slug_by_lang'],
      mainMediaUrl: json['main_media_url'],
    );
  }
}
