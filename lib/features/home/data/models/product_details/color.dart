class Color {
  String? id;
  String? enName;
  String? arName;
  String? code;
  String? creatorId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? nameByLang;

  Color({
    this.id,
    this.enName,
    this.arName,
    this.code,
    this.creatorId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.nameByLang,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json['id'] as String?,
        enName: json['en_name'] as String?,
        arName: json['ar_name'] as String?,
        code: json['code'] as String?,
        creatorId: json['creator_id'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        nameByLang: json['name_by_lang'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'en_name': enName,
        'ar_name': arName,
        'code': code,
        'creator_id': creatorId,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'name_by_lang': nameByLang,
      };
}
