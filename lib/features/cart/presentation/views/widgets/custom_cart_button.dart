
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/features/cart/data/model/my_cart/cart.dart';
import 'package:costly/features/checkout/presentation/views/checkout_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key, required this.cart});
    final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomButton(
        onPressed: () {
          Navigator.pushNamed(context, CheckoutView.routeName,
              arguments: cart);
        },
        text: S.of(context).checkout,
        color: AppColors.primaryColor,
        bottomLeftcircular: 0,
        bottomRightcircular: 0,
      ),
    );
  }
}
