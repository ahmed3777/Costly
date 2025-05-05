import 'package:costly/features/auth/data/models/signup_models/signup_response/user_data.dart';

class LoginResponse {
  UserData? user;
  bool? status;
  int? code;
  dynamic messages;

  LoginResponse({this.user, this.status, this.code, this.messages});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    // Debug: Print the raw response
    print('Raw login response: $json');

    // Use the existing UserData.fromJson factory method
    UserData? userData;
    if (json['user_id'] != null) {
      userData = UserData.fromJson(json);
    }

    return LoginResponse(
      user: userData,
      status: true, // Since we got user data, consider it successful
      code: 200, // Since we got user data, consider it successful
      messages: null, // No error messages if we got user data
    );
  }
}
