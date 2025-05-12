import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/brands/data/models/brand_model.dart';
import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class BrandsRepo {
  Future<Either<Failure, MainResponseModel<BrandModel>>> getBrands();
} 