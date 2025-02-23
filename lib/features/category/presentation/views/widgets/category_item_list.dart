import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/category/presentation/cubit/category/category_cubit.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_item.dart';

class CategoryItemsList extends StatelessWidget {
  const CategoryItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // "All" button
                    Container(
                      width: 100,
                      height: 40,
                      decoration: ShapeDecoration(
                        color: AppColors.brownColor,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 0.40, color: Color(0xFF9B9B9B)),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).allProducts,
                          style: TextStyles.regular14
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                    // SizedBox for spacing
                    const SizedBox(width: 2),
                    // Category items in a horizontally scrolling ListView
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          categoryName: state.category[index].enName,
                        );
                      },
                      itemCount: state.category.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true, // Allow ListView to wrap content
                      physics:const NeverScrollableScrollPhysics(), // Disable ListView's scrolling
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is CategoryFailure) {
          return Center(child: Text(state.message));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
