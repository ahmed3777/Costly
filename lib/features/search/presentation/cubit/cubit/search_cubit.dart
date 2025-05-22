import 'package:costly/features/products/data/models/products/main_products_response.dart';
import 'package:costly/features/search/domin/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> searchByKeyword({required String keyword}) async {
    emit(SearchLoading());
    final result = await searchRepo.searchByKeyword(keyword: keyword);
    result.fold((l) => emit(SearchFailure(message: l.toString())),
        (products) => emit(SearchSuccess(mainProductsResponse: products)));
  }
}
