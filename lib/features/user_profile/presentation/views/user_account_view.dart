import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/user_profile/presentation/views/widgets/user_account_view_body.dart';
import 'package:flutter/material.dart';

class UserAccountView extends StatelessWidget {
  const UserAccountView({super.key});
  static const routeName = 'userAccount';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return  Scaffold(
      key:scaffoldKey ,
      drawer: CustomDrawer(),
      body: UserAccountViewBody(scaffoldKey:scaffoldKey),
    );
  }
}