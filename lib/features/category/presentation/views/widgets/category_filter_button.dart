import 'package:costly/features/home/presentation/cubits/product/product_cubit.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFilterButtons extends StatefulWidget {
  const CategoryFilterButtons({super.key});

  @override
  State<CategoryFilterButtons> createState() => _CategoryFilterButtonsState();
}

class _CategoryFilterButtonsState extends State<CategoryFilterButtons> {
  // Selected index to track which button is active
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List of button labels
    final List<String> filters = [
      S.of(context).allProducts,
      S.of(context).mostRecently,
      S.of(context).highestRated,
      S.of(context).mostPopular,
      S.of(context).lowestPrice,
      S.of(context).highestPrice,
    ];
    return SizedBox(
      height: 50, // Define button height
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(filters.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Update selected index. Clicking "All Products" resets to 0
                    selectedIndex = index;
                  });
                  // Handle filter action here based on selectedIndex
                  final productCubit = context.read<ProductCubit>();

                  if (index == 0) {
                    productCubit.getProducts();
                  } else if (index == 1) {
                    productCubit.getProducts(mostRecently: true);
                  } else if (index == 2) {
                    productCubit.getProducts(highestRated: true);
                  } else if (index == 3) {
                    productCubit.getProducts(mostPopular: true);
                  } else if (index == 4) {
                    productCubit.getProducts(priceLow: true);
                  } else if (index == 5) {
                    productCubit.getProducts(priceHigh: true);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: index == 0
                      ? Colors.brown // "All Products" button always brown
                      : (selectedIndex == index
                          ? Theme.of(context).primaryColor // Selected color
                          : Colors.grey.shade300), // Default color
                  foregroundColor: index == 0
                      ? Colors.white // Text color for "All Products" button
                      : (selectedIndex == index
                          ? Colors.white // Text color for selected button
                          : Colors.black), // Text color for default button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Text(
                  filters[index],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
