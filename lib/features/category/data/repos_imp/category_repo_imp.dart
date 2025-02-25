import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/features/category/data/models/categories_model.dart';
import 'package:costly/features/category/domain/repos/category_repo.dart';
import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryRepoImp implements CategoryRepo {
  final ApiService apiService;

  CategoryRepoImp({
    required this.apiService,
  });
  @override
  Future<Either<Failure, MainResponseModel<CategoriesModel>>>
      getCategories() async {
    try {
      final response = await apiService.get(ApiEndPoints.categories);
      final categories = MainResponseModel<CategoriesModel>.fromJson(
        response.data,
        (json) => CategoriesModel.fromJson(json),
      );
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
