// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

bool isArabic() {
  // Call the `Intl.getCurrentLocale()` method to get the current locale.
  // Compare it with "ar" to check if it is Arabic.
  return Intl.getCurrentLocale() == "ar";
}

// // import 'package:dio/dio.dart';

// // Failure handleError(Dio e) {
//   String errorMessage;

//   switch (e.type) {
//     case DioExceptionType.connectTimeout:
//       errorMessage = "Connection timeout. Please try again.";
//       break;
//     case DioErrorType.sendTimeout:
//       errorMessage = "Send timeout. Please try again.";
//       break;
//     case DioErrorType.receiveTimeout:
//       errorMessage = "Receive timeout. Please try again.";
//       break;
//     case DioErrorType.response:
//       // Handle response errors based on status code
//       if (e.response != null) {
//         final Map<String, dynamic> errorResponse = e.response!.data;

//         // Parse the error response using the ErrorResponse model
//         final parsedError = ErrorResponse.fromJson(errorResponse);

//         // Extracting messages based on your provided structure
//         if (parsedError.messages.isNotEmpty) {
//           // Join all messages into a single string
//           errorMessage = parsedError.messages.values.expand((i) => i).join(', ');
//         } else {
//           errorMessage = "An unknown validation error occurred.";
//         }
//       } else {
//         errorMessage = "Received invalid response from server.";
//       }
//       break;
//     case DioErrorType.cancel:
//       errorMessage = "Request to API was cancelled.";
//       break;
//     default:
//       errorMessage = "An unexpected error occurred: ${e.message}";
//   }

//   return ServerFailure(errorMessage);
// }
