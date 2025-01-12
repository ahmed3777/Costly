import 'package:costly/features/cart/data/model/my_cart/cart_response.dart';
import 'package:costly/features/cart/data/model/my_cart/item.dart';
import 'package:costly/features/cart/domain/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());
  Future<void> getCart() async {
    emit(CartLoading());
    final result= await cartRepo.getCart();
    result.fold(
      (failure) {
        emit(CartFailure( message: failure.errMessage));
      },
      (cart) {
      
        emit(CartSuccess(cart:cart));
      
      },
    );
  }
}