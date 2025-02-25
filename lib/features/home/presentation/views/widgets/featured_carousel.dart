import 'package:carousel_slider/carousel_slider.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/features/home/data/models/banners.dart';
import 'package:costly/features/home/presentation/cubits/banner/banners_cubit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    List<Banners> banners = [];
    return BlocBuilder<BannerCubit, BannersState>(
      builder: (context, state) {
        if (state is BannersLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeFailure) {
          return Center(child: Text(state.message));
        }
        if (state is BannersSuccess) {
          banners = state.banners;
          //final banners = state.banners.payload; // Get the list of banners from the state
          return Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 110.h, // Set the height as needed
                      child: CarouselSlider.builder(
                        itemCount: banners.isEmpty ? 1 : banners.length,
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          height: 100.h,
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPos =
                                  index; // Update the current position of the carousel
                            });
                          },
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: FeaturedItem(
                              index: index,
                              banners:
                                  banners, // Pass the banners to FeaturedItem
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
                        dotsCount: banners.isEmpty
                            ? 1
                            : banners
                                .length, // Number of dots is equal to the number of banners
                        position:
                            currentPos, // Current page position for the dots
                        onTap: (int position) {
                          // Jump to the clicked dot's corresponding page
                          _carouselController.animateToPage(position);
                        },
                        decorator: DotsDecorator(
                          size: Size(30, 4),
                          color: Colors.grey,
                          activeSize: Size(30, 4),
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
        }

        // Default return for any unhandled states (shouldn't normally reach here)
        return const Center(
          child: Text(
            'Something went wrong',
            style: TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }
}
