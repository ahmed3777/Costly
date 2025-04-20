import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/home/data/models/banners.dart';
import 'package:costly/features/home/data/models/city/city.dart';
import 'package:costly/features/home/data/models/country/countrys.dart';
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

  @override
  Future<Either<Failure, MainResponseModel<Country>>> getCountries() async {
    try {
      final response = await apiService.get(ApiEndPoints.countries);

      final countries = MainResponseModel<Country>.fromJson(
        response.data,
        (json) => Country.fromJson(json),
      );
      return right(countries);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MainResponseModel<City>>> getCity(
      String? countryId) async {
    String getCityByCountryId = (countryId == null || countryId.isEmpty)
        ? ApiEndPoints.cities
        : "${ApiEndPoints.countries}/$countryId/${ApiEndPoints.cities}";
    try {
      final response = await apiService.get(getCityByCountryId);

      final cities = MainResponseModel<City>.fromJson(
        response.data,
        (json) => City.fromJson(json),
      );
      return right(cities);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
