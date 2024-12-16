import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/user_profile/presentation/views/widgets/user_setting_view_body.dart';
import 'package:flutter/material.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({super.key, required this.userName, required this.userEmail, required this.userImageUrl, required this.userPhoneNumber});
  static const routeName = 'userSetting';
  final String userName;
  final String userEmail;
  final String userImageUrl;
  final String userPhoneNumber;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: 
      Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: UserSettingViewBody(scaffoldKey:scaffoldKey,
      userName: userName,
      userEmail: userEmail ,
      userImageUrl: userImageUrl ,
      userPhoneNumber: userPhoneNumber,
      ),
    )
    );
  }
}