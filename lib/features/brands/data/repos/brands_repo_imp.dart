import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/brands/data/models/brand_model.dart';
import 'package:costly/features/brands/domain/repos/brands_repo.dart';
import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BrandsRepoImp implements BrandsRepo {
  final ApiService apiService;

  BrandsRepoImp({required this.apiService});

  @override
  Future<Either<Failure, MainResponseModel<BrandModel>>> getBrands() async {
    try {
      final response = await apiService.get(ApiEndPoints.brands);

      final brands = MainResponseModel<BrandModel>.fromJson(
        response.data,
        (json) => BrandModel.fromJson(json),
      );

      return right(brands);
    } on DioException catch (e) {
      return left(handleError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
