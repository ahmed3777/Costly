part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final CartResponse cart;

  CartSuccess({required this.cart});
}

/// Success state for adding a product to the cart
final class CartAddSuccess extends CartState {
  final AddToCart addToCart;

  CartAddSuccess({required this.addToCart});
}

final class CartRemoveSuccess extends CartState {
  //the same model used for adding a product
  final DeleteFromCart deleteFromCart;

  CartRemoveSuccess({required this.deleteFromCart});
}

final class CartFailure extends CartState {
  final String message;

  CartFailure({required this.message});
}

final class Cartincrementsuccess extends CartState {
  final CartResponse cart;

  Cartincrementsuccess({required this.cart});
}

final class Cartdecrementsuccess extends CartState {
  final CartResponse cart;

  Cartdecrementsuccess({required this.cart});
}
final class CartUpdateSuccess extends CartState {
  final CartResponse cart;

  CartUpdateSuccess({required this.cart});
}
class CartLoadingItem extends CartState {
  final String productId;
  final String productVariationId;

  CartLoadingItem({required this.productId, required this.productVariationId});
}

final class CartUpdating extends CartState {
  final String updatingProductId;
  final CartResponse cart;

  CartUpdating({required this.updatingProductId, required this.cart});
}
