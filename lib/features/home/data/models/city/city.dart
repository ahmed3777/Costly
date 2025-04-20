import 'package:costly/features/home/data/models/country/countrys.dart';

class City {
  String? id;
  String enName;
  String arName;
  String? status;
  String? countryId;
  String? creatorId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? nameByLang;
  String? mainMediaUrl;
  Country? country;

  City({
    this.id,
    required this.enName,
    required this.arName,
    this.status,
    this.countryId,
    this.creatorId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.nameByLang,
    this.mainMediaUrl,
    this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as String?,
        enName: json['en_name'] as String,
        arName: json['ar_name'] as String,
        status: json['status'] as String?,
        countryId: json['country_id'] as String?,
        creatorId: json['creator_id'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        nameByLang: json['name_by_lang'] as String?,
        mainMediaUrl: json['main_media_url'] as String?,
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'en_name': enName,
        'ar_name': arName,
        'status': status,
        'country_id': countryId,
        'creator_id': creatorId,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'name_by_lang': nameByLang,
        'main_media_url': mainMediaUrl,
        'country': country?.toJson(),
      };
}
