import 'package:costly/features/brands/presentation/cubit/brands_cubit.dart';
import 'package:costly/features/brands/presentation/cubit/brands_state.dart';
import 'package:costly/features/filter/presentation/views/widgets/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandFilterWidget extends StatelessWidget {
  final List<String> selectedBrands;
  final Function(List<String>) onBrandsChanged;

  const BrandFilterWidget({
    super.key,
    required this.selectedBrands,
    required this.onBrandsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FilterSection(
      title:"brand",
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: BlocBuilder<BrandsCubit, BrandsState>(
          builder: (context, state) {
            if (state is BrandsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BrandsFailure) {
              return Center(child: Text(state.errMessage));
            } else if (state is BrandsSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final brand = state.brands.payload[index];
                  return CheckboxListTile(
                    title: Text(brand.nameByLang),
                    value: selectedBrands.contains(brand.id),
                    onChanged: (value) {
                      final newSelectedBrands = List<String>.from(selectedBrands);
                      if (value == true) {
                        newSelectedBrands.add(brand.id);
                      } else {
                        newSelectedBrands.remove(brand.id);
                      }
                      onBrandsChanged(newSelectedBrands);
                    },
                  );
                },
                itemCount: state.brands.payload.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

