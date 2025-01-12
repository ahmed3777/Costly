part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final CartResponse cart;
  CartSuccess({required this.cart});
}

final class CartFailure extends CartState {
  final String message;
  CartFailure({required this.message});
}
