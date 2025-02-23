import 'package:bloc/bloc.dart';
import 'package:costly/features/products/domain/products_repo.dart';

import 'singleproduct_state.dart';


class SingleproductCubit extends Cubit<SingleproductState> {
  SingleproductCubit(this.productsRepo) : super(SingleproductInitial());
  final  ProductsRepo productsRepo;

  Future<void> getSingleProduct(
      String productId, String productVariationId) async {
    emit(SingleproductLoading());
    final result =
        await productsRepo.getSingleProduct(productId, productVariationId);
    result.fold(
      (failure) {
        emit(SingleproductFailure(failure.errMessage));
      },
      (singleProduct) {
        emit(SingleproductSuccess(singleProduct));
      },
    );
  }
}
