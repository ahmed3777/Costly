import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/filter/presentation/views/widgets/brand_filter.dart';
import 'package:costly/features/filter/presentation/views/widgets/category_filter.dart';
import 'package:costly/features/filter/presentation/views/widgets/filter_section.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:costly/features/brands/presentation/cubit/brands_cubit.dart';

class FilterViewBody extends StatefulWidget {
  const FilterViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<FilterViewBody> createState() => _FilterViewBodyState();
}

class _FilterViewBodyState extends State<FilterViewBody> {
  RangeValues _priceRange = const RangeValues(1000, 3000);
  final List<String> selectedBrands = [];
  final List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    context.read<BrandsCubit>().getBrands();
  }

  List<String> getSelectedBrands() => selectedBrands;
  List<String> getSelectedCategory() => selectedCategories;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHomeAppBar(
          scaffoldKey: widget.scaffoldKey,
          centerText: S.of(context).filter,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterSection(
                  title: 'Popularity',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text('NO Settings', style: TextStyles.light14),
                  ),
                ),
                CategoryFilterWidget(
                    selectedCategory: selectedCategories,
                    onCategoryChanged: (category) {
                      setState(() {
                        selectedCategories.clear();
                        selectedCategories.addAll(category);
                      });
                    }),
                FilterSection(
                  title: 'Color',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      children: [
                        ColorDot(color: Colors.black),
                        SizedBox(width: 12.w),
                        ColorDot(color: Colors.red),
                        SizedBox(width: 12.w),
                        ColorDot(color: Colors.blue),
                      ],
                    ),
                  ),
                ),
                FilterSection(
                  title: 'Size',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Wrap(
                      spacing: 12.w,
                      runSpacing: 8.h,
                      children: [
                        SizeChip(label: '36'),
                        SizeChip(label: '38'),
                        SizeChip(label: '40'),
                      ],
                    ),
                  ),
                ),
                BrandFilterWidget(
                  selectedBrands: selectedBrands,
                  onBrandsChanged: (brands) {
                    setState(() {
                      selectedBrands.clear();
                      selectedBrands.addAll(brands);
                    });
                  },
                ),
                FilterSection(
                  title: 'Price',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_priceRange.start.toInt()} EGP',
                                style: TextStyle(color: AppColors.red)),
                            Text('${_priceRange.end.toInt()} EGP',
                                style: TextStyle(color: AppColors.red)),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColors.red,
                            inactiveTrackColor: AppColors.grey,
                            thumbColor: AppColors.red,
                          ),
                          child: RangeSlider(
                            values: _priceRange,
                            min: 0,
                            max: 4000,
                            onChanged: (RangeValues values) {
                              setState(() {
                                _priceRange = values;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                // Results Button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    onPressed: () {
                      final Map<String, dynamic> filters = {};
                      // Add category if selected
                      if (selectedCategories.isNotEmpty) {
                        filters['categoriesID'] = selectedCategories;
                        print('selectedCategories:   $selectedCategories');
                      }

                      // Add price range if changed from default
                      if (_priceRange.start != 1000 ||
                          _priceRange.end != 3000) {
                        filters['minPrice'] = _priceRange.start;
                        filters['maxPrice'] = _priceRange.end;
                      }

                      // Add selected brands
                      if (selectedBrands.isNotEmpty) {
                        filters['brands'] = selectedBrands;
                      }

                      Navigator.pop(context, filters);
                    },
                    child: Text('Results',
                        style: TextStyles.bold16.copyWith(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
