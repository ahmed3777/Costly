import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/home/data/models/banners.dart';
import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;
  HomeRepoImp({required this.apiService});
  @override
  Future<Either<Failure, MainResponseModel<Banners>>> getBanners() async {
    try {
      final response = await apiService.get(ApiEndPoints.banners);

      final banners = MainResponseModel<Banners>.fromJson(
        response.data,
        (json) => Banners.fromJson(json),
      );
      return right(banners);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}
