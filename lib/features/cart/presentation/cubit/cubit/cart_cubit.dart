import 'package:costly/features/cart/data/model/add_to_cart/add_to_cart.dart';
import 'package:costly/features/cart/data/model/delete_from_cart/delete_from_cart/delete_from_cart.dart';
import 'package:costly/features/cart/data/model/my_cart/cart_response.dart';
import 'package:costly/features/cart/domain/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await cartRepo.getCart();
    result.fold(
      (failure) {
        emit(CartFailure(message: failure.errMessage));
      },
      (cart) {
        print("Cart Success: ${cart.payload.items!.isEmpty}"); // Log empty cart
        emit(CartSuccess(cart: cart));
      },
    );
  }

  Future<void> addToCart({
    required String productId,
    required String productVariationId,
    required int quantity,
    int? length,
    int? chest,
    int? waist,
    int? hip,
  }) async {
    emit(CartLoading());
    final result = await cartRepo.addToCart(
        productId: productId,
        productVariationId: productVariationId,
        quantity: quantity,
        length: length,
        chest: chest,
        waist: waist,
        hip: hip);
    result.fold(
      (failure) {
        emit(CartFailure(message: failure.errMessage));
      },
      (addToCart) async {
        emit(CartAddSuccess(addToCart: addToCart));
        await getCart();
      },
    );
  }

  Future<void> deleteFromCart(
      {required String productId, required String productVariationId}) async {
    emit(CartLoading());
    final result = await cartRepo.deleteFromCart(
        productId: productId, productVariationId: productVariationId);
    result.fold(
      (failure) {
        emit(CartFailure(message: failure.errMessage));
      },
      (deleteFromCart) async {
        emit(CartRemoveSuccess(deleteFromCart: deleteFromCart));
        await getCart();
      },
    );
  }
  Future<void> incrementQuantity(
      {required String productId,
       required String productVariationId,
       }) async {

    final result = await cartRepo.incrementQuantity(
        productId: productId,
        productVariationId: productVariationId,
        quantity: 1);
    result.fold(
      (failure) {
        emit(CartFailure(message: failure.errMessage));
      },
      (updatedCart) async {
        emit(Cartincrementsuccess(cart: updatedCart));
                await getCart();

            // await updateCart(
            // productId: productId,
            //  productVariationId: productVariationId,
            //  quantity: );
      },
    );
  }

  Future<void> decrementQuantity(
      {required String productId,
      required String productVariationId,
      }) async {
    final result = await cartRepo.decrementQuantity(
        productId: productId,
        productVariationId: productVariationId,
        quantity: 1);
    result.fold(
      (failure) {
        emit(CartFailure(message: failure.errMessage));
      },
      (decrement) async {
        emit(Cartdecrementsuccess(cart: decrement));
                await getCart();
    
      //    await updateCart(
      //       productId: productId,
      //       productVariationId: productVariationId,
      //       quantity: quantity);
      // },
      },
    );
  }


  Future<void> updateCart(
      {required String productId,
      required String productVariationId,
      required int quantity}) async {
    // emit(CartUpdating(updatingProductId: productId, cart: (state as CartSuccess).cart));
    final result = await cartRepo.updateCart(
        productId: productId,
        productVariationId: productVariationId,
        quantity: quantity);
    result.fold(
      (failure) {
        emit(CartFailure(message: failure.errMessage));
      },
      (updatedCart) {
        emit(CartUpdateSuccess(cart: updatedCart));
      },
    );
  }
}
