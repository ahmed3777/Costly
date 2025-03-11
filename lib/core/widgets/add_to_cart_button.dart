import 'package:costly/core/helper_functions/show_error_bar.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    super.key,
    required this.productId,
    required this.productVariationId,
  });

  final String productId;
  final String productVariationId;
  @override
  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool isLoading = false;

  Future<void> _handleAddToCart(BuildContext context) async {
    setState(() => isLoading = true); // Start loading

    try {
      // Call addToCart from CartCubit
      await context.read<CartCubit>().addToCart(
            productId: widget.productId,
            productVariationId: widget.productVariationId,
            quantity: 1,
          );

      // Show success message
      showErrorBar(context, 'Product added to cart successfully.');
    } catch (e) {
      // Show error message
      showErrorBar(context, 'Failed to add product to cart.');
    } finally {
      setState(() => isLoading = false); // Stop loading
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: isLoading ? AppColors.primaryColor : AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              )
            : GestureDetector(
                onTap: () => _handleAddToCart(context),
                child: SvgPicture.asset(Assets.imagesCart),
              ),
      ),
    );
  }
}
