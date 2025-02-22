part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final MainProductsResponse products;
  ProductSuccess(this.products);
}

final class ProductFailure extends ProductState {
  final String errMessage;
  ProductFailure(this.errMessage);
}

final class ProductsByCategorySuccess extends ProductState {
  final MainProductsResponse products;
  ProductsByCategorySuccess(this.products);
}