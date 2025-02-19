import 'package:costly/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex});
    final int currentPageIndex ;
  @override
  Widget build(BuildContext context) {
    List<String> getSteps() { 
  return [ 
  S.of(context).address,
  S.of(context).payment,
  S.of(context).summary,
  ];
}
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(getSteps().length, 
        (index) {
          return StepItem(
            text: getSteps()[index],
            index: index,
            isActive:index <= currentPageIndex,);
        },
        ),
        
      ),
    );
  }
  
}
