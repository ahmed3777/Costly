import 'package:flutter/material.dart';

class SingleCategoryView extends StatefulWidget {
  const SingleCategoryView({super.key, required this.categoryId});
      final String? categoryId;

  @override
  State<SingleCategoryView> createState() => _SingleCategoryViewState();
}

class _SingleCategoryViewState extends State<SingleCategoryView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}