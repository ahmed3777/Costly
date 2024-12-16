import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.animationController,
    required this.offset,
  }) : super(key: key);

  final AnimationController animationController;
  final Animation<Offset> offset;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return SlideTransition(
            position: offset,
            child: Text(
              S.of(context).start_shopping,
              style: TextStyles.bold16.copyWith(color: Colors.white),
            ),
          );
        });
  }
}
