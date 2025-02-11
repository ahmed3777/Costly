import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_appbar.dart';
import 'package:costly/features/services/data/service_details/single_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleServiceViewBody extends StatelessWidget {
  const SingleServiceViewBody({
    super.key,
    required this.service,
  });

  final SingleService service;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          backgroundColor: Colors.white,
          imageAsset: Assets.imagesLogo,
          arrowColor: Colors.black,
        ),
        SizedBox(height: 20),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            child: Image.network(
              service.payload!.mainMediaUrl ??
                  "https://costly.mix-code.com/storage/24/dog-puppy-on-garden-royalty-free-image-1586966191-1_cb5f8b154cd9a9216a829a50c7848e32.png",
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 10.h,
        ),
        Text(
          service.payload!.enName ?? '',
          style: TextStyles.regular14.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          service.payload!.enSlug ?? '',
          style: TextStyles.light14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
