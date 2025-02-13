import 'package:costly/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:flutter/material.dart';

import 'inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.text, required this.index,required this.isActive});
  final String text ;
  final int  index;
  final bool isActive ;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: ActiveStepItem(title: text,),
      secondChild: InactiveStepItem(title: text,),
    );
  }
}