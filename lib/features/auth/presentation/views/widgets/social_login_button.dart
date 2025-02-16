import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, required this.image, required this.onPressed, this.width, this.height});
  final double? width;
  final double? height;
  final String image;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Call the provided callback when tapped
      child: Container(
        width: width ?? 90.w,
        height: height ?? 50.h,
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(25), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            image, // Load the image from assets
            width: width ?? 24, // Set the width of the image
            height:  height ??24, // Set the height of the image
            fit: BoxFit.fill, // Adjust how the image fits in the container
          ),
        ),
      ),
    );
  }
}
