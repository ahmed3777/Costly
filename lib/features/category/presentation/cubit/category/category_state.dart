part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoriesModel> category;
  CategorySuccess(this.category);
}

final class CategoryFailure extends CategoryState {
  final String message;
  CategoryFailure(this.message);
}
