import 'package:costly/core/widgets/custom_gradien_card.dart';
import 'package:costly/features/home/data/models/categories_model.dart';
import 'package:costly/features/home/presentation/cubits/category/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryGradientCard extends StatelessWidget {
  const CategoryGradientCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoriesModel> categories = [];
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryFailure) {
          return Center(child: Text(state.message));
        }
        if (state is CategorySuccess) {
          //  final categories = state.category.payload;
          categories = state.category;
          return SizedBox(
            height: 120.h,
            child: ListView.builder(
              itemBuilder: (context, index) => GradientCard(
                imageUrl: categories[index].mainMediaUrl ?? "",
                text: categories[index].enName ?? "",
              ),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        return GradientCard(
            text: "No Data",
            imageUrl:
                "https://costly.mix-code.com/storage/5/beach-2_a122bd1ba7611a9dd03c8f59077830a4.jpg");
      },
    );
  }
}
