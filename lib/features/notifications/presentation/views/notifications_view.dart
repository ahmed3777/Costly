import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/notifications/presentation/cubit/cubit/notifications_cubit.dart';
import 'package:costly/features/notifications/presentation/views/widgets/notifications_view_body.dart'
    show NotificationsViewBody;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});
  static const routeName = 'notifications';

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationsCubit>()..getNotifications(),
      child: SafeArea(
          child: Scaffold(
        drawer: CustomDrawer(),
        body: NotificationsViewBody(scaffoldKey: scaffoldKey),
      )),
    );
  }
}
