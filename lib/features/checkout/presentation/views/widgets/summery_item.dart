import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummeryItem extends StatelessWidget {
  const SummeryItem({
    super.key, required this.name, required this.price, required this.imageUrl, 
  });
  final String name ;
  final String price;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 106.w,
      height: 155.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            width: 106.w,
            height: 101.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Rounded corners for better UI
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl ?? "https://costly.mix-code.com/storage/5/beach-2_a122bd1ba7611a9dd03c8f59077830a4.jpg",
                ),
                fit: BoxFit.cover, // Ensures the ima
              ), 
            ),
           ),
        SizedBox(height: 1.h,),
        SizedBox(width: 106.w,
         child: Text( name, style: TextStyles.light12.copyWith(color: Colors.grey), maxLines: 1, overflow: TextOverflow.ellipsis,)),
        SizedBox(height: 1.h,),
        SizedBox(width: 106,child: Text("LE $price", style: TextStyles.light10.copyWith(color: Colors.grey), maxLines: 1, overflow: TextOverflow.ellipsis,)),
        ]
                 ),
      ),
    );
  }
}