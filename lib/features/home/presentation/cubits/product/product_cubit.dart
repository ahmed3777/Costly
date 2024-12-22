import 'package:bloc/bloc.dart';
import 'package:costly/features/home/data/models/products/main_products_response.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.homeRepo) : super(ProductInitial());
  final HomeRepo homeRepo;

  Future<void> getProducts({
      bool? mostPopular,
      bool? mostRecently,
      bool? highestRated,
  }) async {
    emit(ProductLoading());
    final result = await homeRepo.getProducts(
      mostPopular: mostPopular,
      mostRecently: mostRecently,
      highestRated: highestRated,
    );
    result.fold(
      (failure) {
        emit(ProductFailure(failure.errMessage));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }
    
}
