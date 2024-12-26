import 'package:bloc/bloc.dart';
import 'package:costly/features/home/data/models/product_details/product_details.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'singleproduct_state.dart';

class SingleproductCubit extends Cubit<SingleproductState> {
  SingleproductCubit(this.homeRepo) : super(SingleproductInitial());
  final HomeRepo homeRepo;

  Future<void> getSingleProduct(
      String productId, String productVariationId) async {
    emit(SingleproductLoading());
    final result = await homeRepo.getSingleProduct(productId, productVariationId);
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
