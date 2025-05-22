import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/category/presentation/cubit/category/category_cubit.dart';
import 'package:costly/features/filter/presentation/views/widgets/filter_section.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFilterWidget extends StatelessWidget {
  final List<String> selectedCategory;
  final Function(List<String>) onCategoryChanged;

  const CategoryFilterWidget({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategorySuccess) {
          final categories = state.category; // from payload
          return FilterSection(
            title: S.of(context).category,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CheckboxListTile(
                    value: selectedCategory.contains(category.id ?? ''),
                    onChanged: (value) {
                      final newSelected = List<String>.from(selectedCategory);
                      value == true
                          ? newSelected.add(category.id ?? '')
                          : newSelected.remove(category.id ?? '');
                      onCategoryChanged(newSelected);
                    },
                    title: Text(category.nameByLang ?? '',
                        style: TextStyles.light14),
                  );
                },
              ),
            ),
          );
        } else if (state is CategoryFailure) {
          return Text("Error: ${state.message}");
        } else {
          return const SizedBox.shrink(); // initial
        }
      },
    );
  }
}
