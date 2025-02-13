import 'package:costly/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
     physics: const NeverScrollableScrollPhysics(),
     controller: pageController,
     itemBuilder: (context, index) {
       return getPages()[index];
     },
     itemCount: getPages().length,);
  }
}

List<Widget> getPages() {
  return [
    AddressSection(),
    const Placeholder(),
    const Placeholder(),
  ];
}