import 'package:costly/features/home/data/models/banners.dart';
import 'package:costly/features/home/data/models/city/city.dart';
import 'package:costly/features/home/data/models/country/countrys.dart';
import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, MainResponseModel<Banners>>> getBanners();
  Future<Either<Failure, MainResponseModel<Country>>> getCountries();
  Future<Either<Failure, MainResponseModel<City>>> getCity(String? countryId);
}
