import 'package:costly/features/auth/data/models/signup_models/signup_response/user_data.dart';

class LoginResponse {
  UserData? user;
  bool? status;
  int? code;
  dynamic messages;

  LoginResponse({this.user, this.status, this.code, this.messages});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: json['payload'] == null
            ? null
            : UserData.fromJson(json['payload'] as Map<String, dynamic>),
        status: json['status'] as bool?,
        code: json['code'] as int?,
        messages: json['messages'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'payload': user?.toJson(),
        'status': status,
        'code': code,
        'messages': messages,
      };
}
