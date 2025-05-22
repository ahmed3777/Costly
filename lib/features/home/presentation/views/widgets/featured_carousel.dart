import 'package:carousel_slider/carousel_slider.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/features/home/data/models/banners.dart';
import 'package:costly/features/home/presentation/cubits/banner/banners_cubit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'fearured_item.dart';

class FeaturedCarousel extends StatefulWidget {
  const FeaturedCarousel({super.key});

  @override
  State<FeaturedCarousel> createState() => _FeaturedCarouselState();
}

class _FeaturedCarouselState extends State<FeaturedCarousel> {
  int currentPos = 0; // To track the current page of the dots indicator
  late CarouselSliderController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController();
    // You can optionally call fetchBanners here if required for initial data
    // context.read<HomeCubit>().getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannersState>(
      builder: (context, state) {
        List<Banners> banners = [];
        bool isLoading = false;

        if (state is BannersLoading) {
          isLoading = true;
          banners = List.generate(
            2,
            (index) => Banners(
              id: '',
              mainMediaUrl: '',
              enName: '',
              arName: '',
              enDescription: '',
              arDescription: '',
              creatorId: '',
              deletedAt: '',
              createdAt: '',
              updatedAt: '',
              nameByLang: '',
              descriptionByLang: '',
            ),
          );
        } else if (state is BannersSuccess) {
          banners = state.banners;
        } else if (state is HomeFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        return Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 110.h,
                    child: CarouselSlider.builder(
                      itemCount: banners.length,
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        height: 100.h,
                        autoPlay: !isLoading,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;
                          });
                        },
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Skeletonizer(
                            enabled: isLoading,
                            child: FeaturedItem(
                              index: index,
                              banners: banners,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 15,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: DotsIndicator(
                      dotsCount: banners.length,
                      position: currentPos,
                      onTap: (int position) {
                        _carouselController.animateToPage(position);
                      },
                      decorator: DotsDecorator(
                        size: const Size(30, 4),
                        color: Colors.grey,
                        activeSize: const Size(30, 4),
                        activeColor: AppColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
