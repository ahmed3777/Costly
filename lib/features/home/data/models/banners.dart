class Banners {
  String? id;
  String? enName;
  String? arName;
  String? mediaType;
  String? status;
  String? enDescription;
  String? arDescription;
  String? url;
  String? creatorId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? nameByLang;
  String? descriptionByLang;
  String? mainMediaUrl;

  Banners({
    this.id,
    this.enName,
    this.arName,
    this.mediaType,
    this.status,
    this.enDescription,
    this.arDescription,
    this.url,
    this.creatorId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.nameByLang,
    this.descriptionByLang,
    this.mainMediaUrl,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json['id'] as String?,
        enName: json['en_name'] as String?,
        arName: json['ar_name'] as String?,
        mediaType: json['media_type'] as String?,
        status: json['status'] as String?,
        enDescription: json['en_description'] as String?,
        arDescription: json['ar_description'] as String?,
        url: json['url'] as String?,
        creatorId: json['creator_id'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        nameByLang: json['name_by_lang'] as String?,
        descriptionByLang: json['description_by_lang'] as String?,
        mainMediaUrl: json['main_media_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'en_name': enName,
        'ar_name': arName,
        'media_type': mediaType,
        'status': status,
        'en_description': enDescription,
        'ar_description': arDescription,
        'url': url,
        'creator_id': creatorId,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'name_by_lang': nameByLang,
        'description_by_lang': descriptionByLang,
        'main_media_url': mainMediaUrl,
      };
}
