import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/cart/data/model/add_to_cart/add_to_cart.dart';
import 'package:costly/features/cart/data/model/delete_from_cart/delete_from_cart/delete_from_cart.dart';
import 'package:costly/features/cart/data/model/my_cart/cart_response.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<Failure, CartResponse>> getCart();
  Future<Either<Failure, AddToCart>> addToCart(
      {required String productId,
      required String productVariationId,
      required int quantity,
      int? length,
      int? chest,
      int? waist,
      int? hip
      }
     
      );

  Future<Either<Failure, DeleteFromCart>> deleteFromCart(
      {required String productId, required String productVariationId});
  Future<Either<Failure, CartResponse>> incrementQuantity(
      {required String productId,
      required String productVariationId,
      required int quantity});

  Future<Either<Failure, CartResponse>> decrementQuantity(
      {required String productId,
      required String productVariationId,
      required int quantity});

  Future<Either<Failure, CartResponse>> updateCart(
      {required String productId,
      required String productVariationId,
      required int quantity});
}
