import 'user_profile.dart';

class Profile {
  UserProfile payload;
  bool? status;
  int? code;
  dynamic messages;

  Profile({required this.payload, this.status, this.code, this.messages});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        payload: UserProfile.fromJson(json['payload'] as Map<String, dynamic>),
        status: json['status'] as bool?,
        code: json['code'] as int?,
        messages: json['messages'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'payload': payload.toJson(),
        'status': status,
        'code': code,
        'messages': messages,
      };
}
