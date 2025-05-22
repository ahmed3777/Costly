import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/products/data/models/products/main_products_response.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, MainProductsResponse>> searchByKeyword(
      {required String keyword});
}
