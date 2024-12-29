import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  String? userId;
  String? userName;
  String? userEmail;
  String? userLogo;
  String? userType;
  String? tokenType;
  String? token;

  UserData({
    this.userId,
    this.userName,
    this.userEmail,
    this.userLogo,
    this.userType,
    this.tokenType,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json['user_id'] as String? ?? '',
        userName: json['user_name'] as String? ?? '',
        userLogo: json['user_logo'] as String? ?? '',
        userType: json['user_type'] as String? ?? '',
        tokenType: json['token_type'] as String? ?? '',
        token: json['token'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'user_name': userName,
        'user_logo': userLogo,
        'user_type': userType,
        'token_type': tokenType,
        'token': token,
      };

  factory UserData.fromFirebaseUser(User user) {
    return UserData(
      userName: user.displayName ?? 'Unknown',
      userEmail: user.email ?? 'No Email',
      userId: user.uid,
    );
  }
}
