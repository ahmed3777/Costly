import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:costly/features/brands/data/models/brand_model.dart';

sealed class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsSuccess extends BrandsState {
  final MainResponseModel<BrandModel> brands;
  BrandsSuccess(this.brands);
}

final class BrandsFailure extends BrandsState {
  final String errMessage;
  BrandsFailure(this.errMessage);
} 