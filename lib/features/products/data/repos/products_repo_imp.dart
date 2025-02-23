import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/products/data/models/product_details/product_details.dart';
import 'package:costly/features/products/domain/products_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/products/main_products_response.dart';

class ProductsRepoImp implements ProductsRepo{
  final ApiService apiService;

  ProductsRepoImp({required this.apiService});

  @override
  Future<Either<Failure, MainProductsResponse>> getProducts({
    bool? mostPopular,
    bool? mostRecently,
    bool? highestRated,
    bool? priceLow,
    bool? priceHigh,
  }) async {
    try {
      // Build query parameters based on filter
      final queryParameters = <String, dynamic>{
        if (mostPopular != null) 'most_popular': mostPopular,
        if (mostRecently != null) 'most_recently': mostRecently,
        if (highestRated != null) 'highest_rated': highestRated,
        if (priceLow != null) 'price_low': priceLow,
        if (priceHigh != null) 'price_high': priceHigh
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

  @override
  Future<Either<Failure, MainProductsResponse>> getProductsByCategory({required String categoryId}) async {
    try {
      final response = await apiService.get("products?categories[]=$categoryId",);
      final categories = MainProductsResponse.fromJson(response.data);
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  
}