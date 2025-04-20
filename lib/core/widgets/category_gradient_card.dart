import 'package:costly/core/widgets/custom_gradien_card.dart';
import 'package:costly/features/category/data/models/categories_model.dart';
import 'package:costly/features/category/presentation/cubit/category/category_cubit.dart';
import 'package:costly/features/products/presentation/views/products_by_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryGradientCard extends StatelessWidget {
  const CategoryGradientCard({super.key});

  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
         List<CategoriesModel> categories = [];
    bool isLoading = false;
        if (state is CategoryLoading) {
          isLoading = true;
          categories = List.generate(
            2,
            (index) => CategoriesModel(
              id: '',
              mainMediaUrl: '',
              enName: '',
              arName: '',
              creatorId: '',
              deletedAt: '',
              createdAt: '',
              updatedAt: '',
              nameByLang: '',
              
            ),
          );
        }
        
        else if (state is CategoryFailure) {
          return Center(child: Text(state.message));
        }
        else if (state is CategorySuccess) {
          //  final categories = state.category.payload;
          categories = state.category;
        }
          else{
            return const Center(child: Text("No categories available"));

          }
         return SizedBox(
            height: 120.h,
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProductsByCategoryView.routeName,
                      arguments: {'categoryId': categories[index].id});
                },
                child: Skeletonizer(
                  enabled: isLoading,
                  child: GradientCard(
                    imageUrl: categories[index].mainMediaUrl ?? "",
                    text: categories[index].enName ?? "",
                  ),
                ),
              ),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          );
      
      },
    );
  }
}
