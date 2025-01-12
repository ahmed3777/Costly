import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/cart/data/model/my_cart/cart_response.dart';
import 'package:costly/features/cart/domain/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartRepoImp implements CartRepo {
  final ApiService apiService;

  CartRepoImp({required this.apiService});
  @override
  Future<Either<Failure, CartResponse>> getCart() async {
      try{
        final response = await apiService.get(ApiEndPoints.cart);
        final cart = CartResponse.fromJson(response.data);
        if (cart.code != 200 && cart.code != 201) {
          return left(ServerFailure(cart.messages??"Unknown error occurred."));
        }
        return right(cart);
        
        }
      catch(e){
        if (e is DioException) {
          return left(handleError(e));
        } else {
          return left(ServerFailure(e.toString()));
        }
      }
  }
}