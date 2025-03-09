import 'package:costly/core/errors/failure.dart';
import 'package:dio/dio.dart';

Failure handleError(DioException e) {
  if (e.response != null) {
    // Extract meaningful API messages
    return ServerFailure.fromResponse(e.response?.statusCode, e.response?.data);
  } else {
    return ServerFailure.fromDioError(e);
  }
}