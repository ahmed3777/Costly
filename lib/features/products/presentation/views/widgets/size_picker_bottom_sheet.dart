import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper_functions/build_error_bar.dart'; // Assuming you're using this package for SVG images

// Custom widget to represent the bottom sheet content
class SizePickerBottomSheet extends StatefulWidget {
  const SizePickerBottomSheet(
      {super.key, required this.productId, required this.productVariationId});
  final String productId;
  final String productVariationId;
  @override
  State<SizePickerBottomSheet> createState() => _SizePickerBottomSheetState();
}

class _SizePickerBottomSheetState extends State<SizePickerBottomSheet> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *
          0.5, // You can adjust this as per your need
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Custom size",
              style: TextStyles.regular18 // Replace with your TextStyle
              ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildButton('sm'),
              _buildButton('M'),
              _buildButton('L'),
              _buildButton('XL'),
              _buildButton('XXL'),
            ],
          ),
          SizedBox(
            height: 52,
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: AppColors
                      .primaryColor // Replace with your AppColor.primaryColor
                  ),
              onPressed: () {
                if (_selectedSize != null) {
                  context.read<CartCubit>().addToCart(
                        productId: widget.productId,
                        productVariationId: widget.productVariationId,
                        quantity: 1,
                      );
                  Navigator.pop(context);
                  buildErrorBar(context, 'Product added to cart successfully.');
                  // Navigator.popAndPushNamed(context,CartView.routeName,
                  //   // arguments: {
                  //   //   'selectedSize': _selectedSize, // Pass the selected size
                  //   // },
                  // );
                } else {
                  // Show a message if no size is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a size before proceeding.'),
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/cart.svg', // Replace with your image path
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the MaterialButton
  Widget _buildButton(String size) {
    return SizedBox(
      height: 40.0, // Adjust as per your design
      child: MaterialButton(
        color: _selectedSize == size
            ? AppColors.primaryColor // Highlight selected button
            : Colors.white, // Default button color
        onPressed: () {
          setState(() {
            _selectedSize = size; // Save the selected size
          });
        },
        child: Text(
          size,
          textAlign: TextAlign.center,
          style: TextStyles.regular14.copyWith(
            color: _selectedSize == size ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
