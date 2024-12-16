import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FeaturedItem extends StatelessWidget {
  final int index;
  final List<dynamic> banners;
  const FeaturedItem({super.key, required this.index, required this.banners});
  @override
  Widget build(BuildContext context) {
    String imageUrl = banners[index].mainMediaUrl ?? '';

    var itemWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: SizedBox(
        width: itemWidth,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: 0,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: itemWidth,
                )),
            Padding(
              padding: isArabic()
                  ? EdgeInsets.only(right: 20)
                  : EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      isArabic()
                          ? banners[index].arName ?? ''
                          : banners[index].enName ?? '',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bold13.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: isArabic() ? TextAlign.right : TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10.w,
              bottom: 20.h,
              child: Text(
                isArabic() ? 'المزيد' : 'Show more >',
                style: TextStyles.regular11
                    .copyWith(color: AppColors.primaryColor),
                textAlign: isArabic() ? TextAlign.right : TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
