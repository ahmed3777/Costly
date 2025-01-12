import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/cart/data/model/my_cart/cart_response.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {

  Future <Either<Failure, CartResponse>> getCart();
  
}