import 'package:bloc/bloc.dart';
import 'package:costly/features/home/data/models/products/main_products_response.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.homeRepo) : super(ProductInitial());
  final HomeRepo homeRepo;

  Future<void> getProducts() async {
    emit(ProductLoading());
    final result = await homeRepo.getProducts();
    result.fold(
      (failure) {
        emit(ProductFailure(failure.errMessage));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }

  // Future<void> getSingleProduct(String productId, String productVariationId) async {
  //   emit(ProductLoading());
  //   final result = await homeRepo.getSingleProduct(productId, productVariationId);
  //   result.fold(
  //     (failure) {
  //       emit(ProductFailure(failure.errMessage));
  //     },
  //     (products) {
  //       emit(ProductSuccess(products));
  //       print ("from cubit single product ${products}");
  //     },
  //   );
  // }
}
