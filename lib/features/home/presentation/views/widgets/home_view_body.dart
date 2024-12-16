import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/widgets/category_gradient_card.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/core/widgets/vertical_gradel_of_product_card.dart';
import 'package:costly/core/widgets/row_text_space_between.dart';
import 'package:costly/core/widgets/services_gradien_card.dart';
import 'package:costly/features/home/presentation/views/widgets/featured_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState>scaffoldKey; // Accept scaffoldKey as a parameter

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeAppBar(
                scaffoldKey: widget.scaffoldKey,
              ),
              SizedBox(height: 1.h),
              FeaturedCarousel(), // You can call the banners widget here
              SizedBox(height: 5.h),
              SpaceBetweenTextRow(
                leftText: isArabic() ? 'الأقسام' : 'Categories',
                rightText: isArabic() ? 'المزيد' : 'See all',
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: (8.0)),
                child: CategoryGradientCard(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "New suits collection ...",
                  style: TextStyles.regular14,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
        VerticalGraidelOfProductCard(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              SpaceBetweenTextRow(
                leftText: isArabic() ? 'الخدمات' : 'Services',
                rightText: isArabic() ? 'المزيد' : 'See all',
              ),
              SizedBox(
                height: 5.h,
              )
            ],
          ),
        ),
        ServicesGradienCard(),
      ],
    );
  }
}
