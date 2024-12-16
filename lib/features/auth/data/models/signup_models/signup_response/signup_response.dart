import 'user_data.dart';

class SignupResponse {
  UserData? userData;
  bool? status;
  int? code;
  dynamic messages;

  SignupResponse({this.userData, this.status, this.code, this.messages});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      userData: json['payload'] == null
          ? null
          : UserData.fromJson(json['payload'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
      messages: json['messages'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'payload': userData?.toJson(),
        'status': status,
        'code': code,
        'messages': messages,
      };
}
