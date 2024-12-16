import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming you're using this package for SVG images

// Custom widget to represent the bottom sheet content
class CustomShetButtom extends StatelessWidget {
  const CustomShetButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *0.5, // You can adjust this as per your need
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
              onPressed: () {},
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
        color: Colors.white,
        onPressed: () {},
        child: Text(size,
            textAlign: TextAlign.center, style: TextStyles.regular14),
      ),
    );
  }
}
