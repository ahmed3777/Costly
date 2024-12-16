class SocialGoogle {
  String? name;
  String? email;
  String? accountSocialProvider;
  String? type;

  SocialGoogle({
    this.name,
    this.email,
    this.accountSocialProvider,
    this.type,
  });

  factory SocialGoogle.fromJson(Map<String, dynamic> json) => SocialGoogle(
        name: json['name'] as String?,
        email: json['email'] as String?,
        accountSocialProvider: json['account_social_provider'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'account_social_provider': accountSocialProvider,
        'type': type,
      };
}
