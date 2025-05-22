import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/features/search/presentation/cubit/cubit/search_cubit.dart';
import 'package:costly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsView extends StatefulWidget {
  final String query;
  const SearchProductsView({super.key, required this.query});
  static const routeName = 'searchProductsView';
  @override
  State<SearchProductsView> createState() => _SearchProductsViewState();
}

class _SearchProductsViewState extends State<SearchProductsView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.query);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _handleBack() {
    searchController.clear();
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocProvider(
        create: (context) =>
            getIt<SearchCubit>()..searchByKeyword(keyword: widget.query),
        child: SafeArea(
          child: Scaffold(
            body: SearchViewBody(
              searchController: searchController,
              onBackPressed: _handleBack,
            ),
          ),
        ),
      ),
    );
  }
}
