import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Request timeout. Please try again.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Server is taking too long to respond.');

      case DioExceptionType.cancel:
        return ServerFailure('Request was canceled.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);

      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection.');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Something went wrong. Please try again.');
    }
  }

  /// Extracts meaningful messages from API responses

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response?['messages'] ?? 'Authentication error.');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else if (statusCode == 422) {
      return ServerFailure(
          response?['messages'] ?? 'Validation error occurred.');
    } else {
      return ServerFailure('Unexpected error occurred.');
    }
  }
}

/// Custom exception for API errors
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}
