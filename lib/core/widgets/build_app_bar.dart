import 'package:costly/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context,
) {
  return AppBar(
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Center(
      child: Text(
        "",
        textAlign: TextAlign.center,
        style: TextStyles.bold18,
      ),
    ),
  );
}
