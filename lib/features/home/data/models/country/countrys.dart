class Country {
  String? id;
  String enName;
  String arName;
  String? lang;
  String? currency;
  String? countryCode;
  String? status;
  String? creatorId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? nameByLang;
  String? mainMediaUrl;

  Country({
    this.id,
    required this.enName,
    required this.arName,
    this.lang,
    this.currency,
    this.countryCode,
    this.status,
    this.creatorId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.nameByLang,
    this.mainMediaUrl,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json['id'] as String?,
        enName: json['en_name'] as String,
        arName: json['ar_name'] as String,
        lang: json['lang'] as String?,
        currency: json['currency'] as String?,
        countryCode: json['country_code'] as String?,
        status: json['status'] as String?,
        creatorId: json['creator_id'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        nameByLang: json['name_by_lang'] as String?,
        mainMediaUrl: json['main_media_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'en_name': enName,
        'ar_name': arName,
        'lang': lang,
        'currency': currency,
        'country_code': countryCode,
        'status': status,
        'creator_id': creatorId,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'name_by_lang': nameByLang,
        'main_media_url': mainMediaUrl,
      };
}
