import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/products/data/models/product_details/product_details.dart';
import 'package:costly/features/products/domain/products_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/products/main_products_response.dart';

class ProductsRepoImp implements ProductsRepo {
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
      final queryParameters = <String, dynamic>{
        if (mostPopular != null) 'most_popular': mostPopular,
        if (mostRecently != null) 'most_recently': mostRecently,
        if (highestRated != null) 'highest_rated': highestRated,
        if (priceLow != null) 'price_low': priceLow,
        if (priceHigh != null) 'price_high': priceHigh,
      };

      final response = await apiService.get(
        ApiEndPoints.products,
        queryParameters: queryParameters,
      );

      final products = MainProductsResponse.fromJson(response.data);

      // Check if the API response indicates an error
      if (products.code != 200 && products.code != 201) {
        return left(ServerFailure(
            products.messages?.toString() ?? 'Unknown error occurred.'));
      }

      return right(products);
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response?.data != null) {
        final errorData = e.response!.data;
        if (errorData is Map<String, dynamic> &&
            errorData['messages'] != null) {
          return left(ServerFailure(errorData['messages'].toString()));
        }
      }
      return left(handleError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductDetails>> getSingleProduct(
      String productId, String productVariationId) async {
    try {
      final response = await apiService.get(
          '${ApiEndPoints.products}/$productId/${ApiEndPoints.singleProduct}/$productVariationId');

      final productDetails = ProductDetails.fromJson(response.data);

      // Check if the API response indicates an error
      if (productDetails.code != 200 && productDetails.code != 201) {
        return left(ServerFailure(
            productDetails.messages?.toString() ?? 'Unknown error occurred.'));
      }

      return right(productDetails);
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response?.data != null) {
        final errorData = e.response!.data;
        if (errorData is Map<String, dynamic> &&
            errorData['messages'] != null) {
          return left(ServerFailure(errorData['messages'].toString()));
        }
      }
      return left(handleError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MainProductsResponse>> getProductsByCategory(
      {required String categoryId}) async {
    try {
      final response = await apiService.get(
        "products?categories[]=$categoryId",
      );

      final products = MainProductsResponse.fromJson(response.data);

      // Check if the API response indicates an error
      if (products.code != 200 && products.code != 201) {
        return left(ServerFailure(
            products.messages?.toString() ?? 'Unknown error occurred.'));
      }

      return right(products);
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response?.data != null) {
        final errorData = e.response!.data;
        if (errorData is Map<String, dynamic> &&
            errorData['messages'] != null) {
          return left(ServerFailure(errorData['messages'].toString()));
        }
      }
      return left(handleError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MainProductsResponse>> filterProducts({
    int? priceFrom,
    int? priceTo,
    List<String>? selectedBrands,
    List<String>? selectedCategoryis,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        if (priceFrom != null) 'price_from': priceFrom,
        if (priceTo != null) 'price_to': priceTo,
        if (selectedBrands != null && selectedBrands.isNotEmpty)
          'brands[]': selectedBrands,
        if (selectedCategoryis != null && selectedCategoryis.isNotEmpty)
          'categories[]': selectedCategoryis,
      };

      final response = await apiService.get(
        ApiEndPoints.products,
        queryParameters: queryParameters,
      );

      final products = MainProductsResponse.fromJson(response.data);

      // Check if the API response indicates an error
      if (products.code != 200 && products.code != 201) {
        return left(ServerFailure(
            products.messages?.toString() ?? 'Unknown error occurred.'));
      }

      return right(products);
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response?.data != null) {
        final errorData = e.response!.data;
        if (errorData is Map<String, dynamic> &&
            errorData['messages'] != null) {
          return left(ServerFailure(errorData['messages'].toString()));
        }
      }
      return left(handleError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
