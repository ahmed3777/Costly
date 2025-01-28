import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:dio/dio.dart';
import '../networking/dio_factory.dart'; // Import your DioFactory class

class ApiService {
  final Dio _dio = DioFactory.getDio();
  // Method to perform a GET request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      final headers = <String, String>{};
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
      final response = await _dio.get(endpoint,
          options: Options(headers: headers), queryParameters: queryParameters);
      return response;
      // Return the response if successful
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception(e.message);
      }
      // Handle error and return a custom response
    }
  }

// Method to perform a POST request
  Future<dynamic> post(
    String endpoint,
    data,
  ) async {
    try {
      // Perform the POST request
      final response = await _dio.post(
        endpoint,
        data: data,
      );
      if (response.data['status'] == 200 || response.data['status'] == 201) {
        SharedPref.setSecuredString(
            SharedPrefKeys.userToken, response.data['payload']["token"]);
        print('token from post API Services: ' + response.data['token']);
      }
      return response.data;
      // Return the response if successful
    } on DioException catch (e) {
      if (e.response != null) {
        // If there's a response from the server, extract the message
        String errorMessage;
        if (e.response!.data is Map<String, dynamic>) {
          // Check if the response data is a map and contains a 'message' key
          errorMessage = e.response!.data['messages'].toString();
        } else {
          errorMessage = 'An unknown error occurred.';
        }
        throw Exception(
            errorMessage); // Throw a custom exception with the message
      } else {
        // If there's no response, throw a general error message
        throw Exception("Error from the API service: ${e.message}");
      }
    }
  }
//  }
  // Method to perform a PUT request

// Centralized error handling method
}
