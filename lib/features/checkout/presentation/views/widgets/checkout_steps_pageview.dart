import 'package:costly/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:costly/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:flutter/material.dart';

import 'summery_section.dart';

class CheckoutStepsPageView extends StatefulWidget {
  const CheckoutStepsPageView(
      {super.key,
      required this.pageController,
      required this.onPaymentMethodChanged});
  final PageController pageController;
  final Function(String) onPaymentMethodChanged;

  @override
  State<CheckoutStepsPageView> createState() => _CheckoutStepsPageViewState();
}

class _CheckoutStepsPageViewState extends State<CheckoutStepsPageView> {
  String? address;
  void updateAddress(String newAddress) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Ensure widget is still mounted before calling setState
        setState(() {
          address = newAddress;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      itemBuilder: (context, index) {
        return getPages()[index];
      },
      itemCount: getPages().length,
    );
  }

  List<Widget> getPages() {
    return [
      AddressSection(onAddressChanged: updateAddress),
      PaymentSection(
        onPaymentMethodChanged: widget.onPaymentMethodChanged,
      ),
      SummerySection(
        pageController: widget.pageController,
        address: address,
      ),
    ];
  }
}
