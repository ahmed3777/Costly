import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/search/presentation/views/widgets/search_result_list.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
    required this.searchController,
    this.onBackPressed,
  });
  final TextEditingController searchController;
  final VoidCallback? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         CustomHomeAppBar(
           scaffoldKey: GlobalKey<ScaffoldState>(),
           searchController: searchController,
           onBackPressed: onBackPressed,
         ),
         Expanded(
            child: SearshResultList(),
          )
       ],
     );
  }
}