import 'package:bloc/bloc.dart';
import 'package:costly/features/products/domain/products_repo.dart';
import 'package:costly/features/products/presentation/cubit/product/product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productsRepo) : super(ProductInitial());
  final ProductsRepo productsRepo;

  Future<void> getProducts({
    bool? mostPopular,
    bool? mostRecently,
    bool? highestRated,
    bool? priceLow,
    bool? priceHigh,
  }) async {
    emit(ProductLoading());
    final result = await productsRepo.getProducts(
      mostPopular: mostPopular,
      mostRecently: mostRecently,
      highestRated: highestRated,
      priceLow: priceLow,
      priceHigh: priceHigh,
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

    Future <void> getProductsByCategory({required String categoryId}) async {
    emit(ProductLoading());
    final result = await productsRepo.getProductsByCategory(categoryId: categoryId);
    result.fold(
      (failure) {
        emit(ProductFailure(failure.errMessage));
      },
      (products) {
        emit(ProductsByCategorySuccess(products));
      },
    );
  }
}
