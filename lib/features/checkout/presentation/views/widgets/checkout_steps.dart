import 'package:costly/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(getSteps().length, 
        (index) {
          return StepItem(
            text: getSteps()[index],
            index: index,
             isActive:false);
        },
        ),
        
      ),
    );
  }
}
List<String> getSteps() { 
  return [ 
  "Address",
  "Payment",
  "Summary",
  ];
}