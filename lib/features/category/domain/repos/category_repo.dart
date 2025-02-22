
  import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/category/data/models/categories_model.dart';
import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepo {
    Future<Either<Failure, MainResponseModel<CategoriesModel>>> getCategories();
  }
