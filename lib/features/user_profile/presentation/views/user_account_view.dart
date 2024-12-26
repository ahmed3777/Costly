import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'widgets/user_account_view_body.dart';

class UserAccountView extends StatelessWidget {
  const UserAccountView({super.key});
  static const routeName = 'userAccount';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: UserAccountViewBody(scaffoldKey: scaffoldKey),
    );
  }
}
