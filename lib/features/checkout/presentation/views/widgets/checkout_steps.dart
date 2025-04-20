import 'package:costly/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});
  final int currentPageIndex;
  final PageController pageController;
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
        children: List.generate(
          getSteps().length,
          (index) {
            return GestureDetector(
              onTap: () {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: StepItem(
                text: getSteps()[index],
                index: index,
                isActive: index <= currentPageIndex,
              ),
            );
          },
        ),
      ),
    );
  }
}
