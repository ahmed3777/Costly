import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/products/data/models/products/main_products_response.dart';
import 'package:costly/features/search/domin/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;
  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Failure, MainProductsResponse>> searchByKeyword({required String keyword}) async {
    try{
        final response = await apiService.get(ApiEndPoints.products,
         queryParameters: {'keyword': keyword});
        final result = MainProductsResponse.fromJson(response.data);
        return right(result);
        }catch(e){
          if(e is DioException){
            return left(handleError(e));
          }else{
            return left(ServerFailure(e.toString()));
          }
        }
        }


}