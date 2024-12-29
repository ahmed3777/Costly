import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/user_profile/presentation/cubit/cubit/user_profile_cubit.dart';
import 'package:costly/features/user_profile/presentation/views/widgets/user_setting_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({super.key});
  static const routeName = 'userSetting';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
        child: BlocProvider(
      create: (context) => getIt<UserProfileCubit>()..getUserProfile(),
      child: Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(),
          body: UserSettingViewBody(scaffoldKey: scaffoldKey)),
    ));
  }
}
