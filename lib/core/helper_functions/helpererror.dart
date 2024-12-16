// import 'package:costly/core/errors/failure.dart';
// import 'package:dio/dio.dart';

// Failure  handleError(DioException e) {
//   String errorMessage;

//   if (e.type == DioExceptionType.cancel) {
//     errorMessage = "Request to API was cancelled";
//   } else if (e.type == DioExceptionType.connectionTimeout) {
//     errorMessage = "Connection timeout with API";
//   } else if (e.type == DioExceptionType.sendTimeout) {
//     errorMessage = "Send timeout in connection with API";
//   } else if (e.type == DioExceptionType.receiveTimeout) {
//     errorMessage = "Receive timeout in connection with API";
//   } else if (e.type == DioExceptionType.unknown) {
//     // The server responded with an error code
//     switch (e.response?.statusCode) {
//       case 400:
//         errorMessage = "Bad request: ${e.response?.data}";
//         break;
//       case 401:
//         errorMessage = "Unauthorized: ${e.response?.data}";
//         break;
//       case 403:
//         errorMessage = "Forbidden: ${e.response?.data}";
//         break;
//       case 404:
//         errorMessage = "Not found: ${e.response?.data}";
//         break;
//       case 500:
//         errorMessage = "Internal server error: ${e.response?.data}";
//         break;
//       default:
//         errorMessage =
//             "Received invalid status code: ${e.response?.statusCode}";
//     }
//   } else if (e.type == DioExceptionType.badResponse) {
//     // Other types of errors (like network issues)
//     errorMessage = "Unexpected error occurred: ${e.message}";
//   } else {
//     errorMessage = "Something went wrong";
//   }

//   // Optionally log the error or send it to an analytics service

//   throw Exception(
//       errorMessage); // Throwing an exception with a user-friendly message
// }

import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/auth/data/models/signup_models/signup_response/error_response.dart';
import 'package:dio/dio.dart';

Failure handleError(DioException e) {
  String errorMessage;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      errorMessage = "Connection timeout. Please try again.";
      break;
    case DioExceptionType.sendTimeout:
      errorMessage = "Send timeout. Please try again.";
      break;
    case DioExceptionType.receiveTimeout:
      errorMessage = "Receive timeout. Please try again.";
      break;
    case DioExceptionType.badResponse:
      // Handle response errors based on status code
      if (e.response != null) {
        final Map<String, dynamic> errorResponse = e.response!.data;

        // Parse the error response using the ErrorResponse model
        final parsedError = ErrorResponse.fromJson(errorResponse);

        // Extracting messages based on your provided structure
        if (parsedError.messages.isNotEmpty) {
          // Join all messages into a single string
          errorMessage =
              parsedError.messages.values.expand((i) => i).join(', ');
        } else {
          errorMessage = "An unknown validation error occurred.";
        }
      } else {
        errorMessage = "Received invalid response from server.";
      }
      break;
    case DioExceptionType.cancel:
      errorMessage = "Request to API was cancelled.";
      break;
    default:
      errorMessage = "An unexpected error occurred: ${e.message}";
  }

  return ServerFailure(errorMessage);
}
