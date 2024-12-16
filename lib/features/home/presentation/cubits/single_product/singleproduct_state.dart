part of 'singleproduct_cubit.dart';

@immutable
sealed class SingleproductState {}

final class SingleproductInitial extends SingleproductState {}

final class SingleproductLoading extends SingleproductState {}

final class SingleproductSuccess extends SingleproductState {
  final ProductDetails singleProduct;
  SingleproductSuccess(this.singleProduct);
}

final class SingleproductFailure extends SingleproductState {
  final String errMessage;
  SingleproductFailure(this.errMessage);
}
