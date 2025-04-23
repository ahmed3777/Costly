
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/search/presentation/views/widgets/search_result_list.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
    required this.scaffoldKey,
    required this.searchController,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         CustomHomeAppBar(
           scaffoldKey: scaffoldKey,
           centerText: S.of(context).search,
           searchController: searchController,
         ),
         Expanded(
            child: SearshResultList(),
          )
       ],
     );
  }
}
