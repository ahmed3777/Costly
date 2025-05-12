import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/notifications/presentation/views/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    // required this.visible,
  });
  //final bool? visible;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, NotificationsView.routeName);
        },
        icon: Badge.count(
          count: 1,
          backgroundColor: AppColors.goald,
          child: SvgPicture.asset(
            Assets.imagesNotification,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
