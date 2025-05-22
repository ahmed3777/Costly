import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/orders/data/model/orders/orders.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepo {
  Future<Either<Failure, MainOrders>> getOrders();
  Future<Either<Failure, MainOrders>> getSingleOrder(String orderId);
}