import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/category/data/models/categories_model.dart';
import 'package:costly/features/home/data/models/banners.dart';
import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:costly/features/home/data/models/product_details/product_details.dart';
import 'package:costly/features/home/data/models/products/main_products_response.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;
  HomeRepoImp({required this.apiService});
  @override
  Future<Either<Failure, MainResponseModel<Banners>>> getBanners() async {
    try {
      final response = await apiService.get(ApiEndPoints.banners);

      final banners = MainResponseModel<Banners>.fromJson(
        response.data,
        (json) => Banners.fromJson(json),
      );
      return right(banners);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MainResponseModel<CategoriesModel>>>getCategories() async {
    try {
      final response = await apiService.get(ApiEndPoints.categories);
      final categories = MainResponseModel<CategoriesModel>.fromJson(
        response.data,
        (json) => CategoriesModel.fromJson(json),
      );
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
Future<Either<Failure, MainProductsResponse>> getProducts({
  bool? mostPopular,
  bool? mostRecently,
  bool? highestRated,
}) async {
  try {
    // Build query parameters based on filter
    final queryParameters = <String, dynamic>{
      if (mostPopular != null) 'most_popular': mostPopular,
      if (mostRecently != null) 'most_recently': mostRecently,
      if (highestRated != null) 'highest_rated': highestRated,
    };
    final response = await apiService.get(
      ApiEndPoints.products,
      queryParameters: queryParameters, // Pass query parameters here
    );

    final products = MainProductsResponse.fromJson(response.data);
    return right(products);
  } catch (e) {
    if (e is DioException) {
      return left(handleError(e));
    } else {
      return left(ServerFailure(e.toString()));
    }
  }
}

  @override
  Future<Either<Failure, ProductDetails>> getSingleProduct(
      String productId, String productVariationId) async {
    try {
      final response = await apiService.get(
          '${ApiEndPoints.products}/$productId/${ApiEndPoints.singleProduct}/$productVariationId');
      final products = ProductDetails.fromJson(response.data);
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  

 }