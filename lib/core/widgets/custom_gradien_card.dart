import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientCard extends StatefulWidget {
  final String text; // The text to be displayed
  final String imageUrl; // The URL or asset path of the image
  const GradientCard({
    super.key,
    required this.text,
    required this.imageUrl,
  });
  @override
  State<GradientCard> createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: (2)),
      child: SizedBox(
        width: 106.w,
        height: 101.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image Widget

            Positioned.fill(
              child: Image.network(
                widget.imageUrl.isNotEmpty ? widget.imageUrl :
                    "https://costly.mix-code.com/storage/5/beach-2_a122bd1ba7611a9dd03c8f59077830a4.jpg",
                 // Provide either an asset or a network URL
                width: 50.w, // Adjust the width as necessary
                height: 50.h,
                // Adjust the height as necessary
                fit: BoxFit.cover,
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xE53B6273), Colors.black.withOpacity(0.3)],
                  ),
                  // borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            // Text Widget
            Positioned(
              bottom: 10.h,
              right: 8.w,
              left: 8.w, // Adjust the position of the text as necessary
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyles.regular14
                    .copyWith(color: Colors.white), // Apply custom text style
              ),
            ),
          ],
        ),
      ),
    );
  }
}
