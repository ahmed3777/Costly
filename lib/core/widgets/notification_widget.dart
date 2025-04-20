import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/notifications/presentation/views/notifications_view.dart'
    show NotificationsView;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.visible,
  });
  final bool? visible;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Visibility(
              visible: visible ?? false,
              child: IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, FilterView.routeName);
                },
                icon: SvgPicture.asset(
                  Assets.imagesFiltericon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationsView.routeName);
            },
            icon: Badge.count(
              count: 2,
              backgroundColor: AppColors.goald,
              child: SvgPicture.asset(
                Assets.imagesNotification,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
