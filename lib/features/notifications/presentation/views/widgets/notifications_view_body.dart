import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_appbar.dart';
import 'package:costly/features/notifications/presentation/views/widgets/notification_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        CustomAppbar(
          backgroundColor: Colors.white,
          imageAsset: Assets.imagesCostly,
          arrowColor: Colors.black,
        ),
        SizedBox(height: 60.h),
        NotificationItemList(),
      ]),
    );
  }
}
