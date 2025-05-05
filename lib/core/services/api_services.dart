import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:dio/dio.dart';
import '../networking/dio_factory.dart';

class ApiService {
  final Dio _dio = DioFactory.getDio();

  /// GET request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      final headers = _buildHeaders(token);
      return await _dio.get(endpoint,
          options: Options(headers: headers), queryParameters: queryParameters);
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

  /// POST request
  Future<dynamic> post(String endpoint, dynamic data, {String? token}) async {
    try {
      final headers = _buildHeaders(token);
      final response = await _dio.post(endpoint,
          data: data, options: Options(headers: headers));

      return _handleResponse(response);
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

  /// DELETE request
  Future<dynamic> delete(String endpoint, dynamic data, {String? token}) async {
    try {
      final headers = _buildHeaders(token);
      final response = await _dio.delete(endpoint,
          data: data, options: Options(headers: headers));

      return _handleResponse(response);
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

  /// PATCH request
  Future<dynamic> patch(String endpoint, dynamic data, {String? token}) async {
    try {
      final headers = _buildHeaders(token);
      final response = await _dio.patch(endpoint,
           data: data,
           options: Options(headers: headers));

      return _handleResponse(response);
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

  /// **Helper to extract meaningful response data**
  dynamic _handleResponse(Response response) {
    final responseData = response.data as Map<String, dynamic>;

    if (responseData['status'] == true) {
      return responseData['payload'];
    } else {
      throw ApiException(responseData['messages'] ?? 'Unknown error occurred.');
    }
  }

  /// **Helper to build headers**
  Map<String, String> _buildHeaders(String? token) {
    final headers = <String, String>{};
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }
}
