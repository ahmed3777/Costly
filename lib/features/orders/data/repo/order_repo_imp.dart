import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/orders/data/model/orders/orders.dart';
import 'package:costly/features/orders/domain/repo/order_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OrderRepoImp implements OrderRepo {

  OrderRepoImp({required this.apiService});
    final ApiService apiService;

  @override
  Future<Either<Failure, MainOrders>> getOrders()async {
    try{
      final response = await apiService.get(ApiEndPoints.orders);
      final orders = MainOrders.fromJson(response.data);
      if (orders.code != 200 && orders.code != 201) {
        return left(ServerFailure(orders.messages ?? "Unknown error occurred."));
      }
      return right(orders);
    }catch(e){
      if(e is DioException){
        return left(handleError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }

    }
  }
  
  @override
  Future<Either<Failure, MainOrders>> getSingleOrder(String orderId) async {
    try {
      final response = await apiService.get(
        '${ApiEndPoints.singleOrders}/$orderId',
      );

      final order = MainOrders.fromJson(response.data);

      if (order.code != 200 && order.code != 201) {
        return left(ServerFailure(
            order.messages?.toString() ?? 'Unknown error occurred.'));
      }

      return right(order);
    } on DioException catch (e) {
      return left(handleError(e));

  }
  }
}