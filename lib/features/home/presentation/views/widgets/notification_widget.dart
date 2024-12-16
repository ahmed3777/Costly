import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Badge.count(count: 22,
    child: SvgPicture.asset(
     'assets/images/notification.svg',
      width: 24,
     height: 24,
    ),
    ),
    );
  }
}
