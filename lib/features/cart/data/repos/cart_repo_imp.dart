import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/features/cart/data/model/add_to_cart/add_to_cart.dart';
import 'package:costly/features/cart/data/model/delete_from_cart/delete_from_cart/delete_from_cart.dart';
import 'package:costly/features/cart/data/model/my_cart/cart_response.dart';
import 'package:costly/features/cart/domain/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartRepoImp implements CartRepo {
  final ApiService apiService;

  CartRepoImp({required this.apiService});

  Future<String?> getToken() async {
    return await SharedPref.getSecuredString(SharedPrefKeys.userToken);
  }

  @override
  Future<Either<Failure, CartResponse>> getCart() async {
    try {
      final token = await getToken();
      final response = await apiService.get(ApiEndPoints.cart, token: token);
      final cart = CartResponse.fromJson(response.data);
      if (cart.code != 200 && cart.code != 201) {
        return left(ServerFailure(cart.messages ?? "Unknown error occurred."));
      }
      return right(cart);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AddToCart>> addToCart({
    required String productId,
    required String productVariationId,
    required int quantity,
    int? length,
    int? chest,
    int? waist,
    int? hip,
  }) async {
    try {
      final token = await getToken();
      final response = await apiService.post(
          ApiEndPoints.addToCart,
          {
            'product_id': productId,
            'product_variation_id': productVariationId,
            'quantity': quantity,
            if (length != null) 'length': length,
            if (chest != null) 'chest': chest,
            if (waist != null) 'waist': waist,
            if (hip != null) 'hip': hip
          },
          token: token);
      final addToCart = AddToCart.fromJson(response);
      return right(addToCart);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, DeleteFromCart>> deleteFromCart(
      {required String productId, required String productVariationId}) async {
    try {
      final token = await getToken();

      final response = await apiService.delete(
          ApiEndPoints.removeFromCart,
          {
            'product_id': productId,
            'product_variation_id': productVariationId,
          },
          token: token);
      print("response: $response");
      final removeFromCart = DeleteFromCart.fromJson(response);
      return right(removeFromCart);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartResponse>> decrementQuantity(
      {required String productId,
      required String productVariationId,
      required int quantity}) async {
    try {
      final token = await getToken();
      final response = await apiService.patch(
          ApiEndPoints.decrementQuantity,
          {
            'product_id': productId,
            'product_variation_id': productVariationId,
            'quantity': quantity
          },
          token: token);
      final decrementQuantity = CartResponse.fromJson(response);
      return right(decrementQuantity);
    } catch (e) {
      return left(
          e is DioException ? handleError(e) : ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartResponse>> incrementQuantity(
      {required String productId,
      required String productVariationId,
      required int quantity}) async {
    try {
      final token = await getToken();
      final response = await apiService.patch(
          ApiEndPoints.incrementQuantity,
          {
            'product_id': productId,
            'product_variation_id': productVariationId,
            'quantity': quantity
          },
          token: token);
      final incrementQuantity = CartResponse.fromJson(response);
      return right(incrementQuantity);
    } catch (e) {
      return left(
          e is DioException ? handleError(e) : ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartResponse>> updateCart(
      {required String productId,
      required String productVariationId,
      required int quantity}) async {
    try {
      final token = await getToken();
      final response = await apiService.patch(
          ApiEndPoints.updateCart,
          {
            'product_id': productId,
            'product_variation_id': productVariationId,
            'quantity': quantity
          },
          token: token);
      final updateCart = CartResponse.fromJson(response);
      return right(updateCart);
    } catch (e) {
      return left(
          e is DioException ? handleError(e) : ServerFailure(e.toString()));
    }
  }
}
