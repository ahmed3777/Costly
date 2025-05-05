class FcmToken {
  String? token;
  FcmToken({
    this.token,
  });

  factory FcmToken.fromJson(Map<String, dynamic> json) => FcmToken(
        token: json['token'] as String?,
      );
}