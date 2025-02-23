class MediaLink {
  int? id;
  String? filename;
  int? size;
  String? link;
  String? mimeType;

  MediaLink({this.id, this.filename, this.size, this.link, this.mimeType});

  factory MediaLink.fromJson(Map<String, dynamic> json) => MediaLink(
        id: json['id'] as int?,
        filename: json['filename'] as String?,
        size: json['size'] as int?,
        link: json['link'] as String?,
        mimeType: json['mime_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'filename': filename,
        'size': size,
        'link': link,
        'mime_type': mimeType,
      };
}
