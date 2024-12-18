import 'package:costly/features/home/data/models/banners.dart';
import 'package:costly/features/category/data/models/categories_model.dart';
import 'package:costly/features/home/data/models/main_response_model.dart';
import 'package:costly/features/home/data/models/product_details/product_details.dart';
import 'package:costly/features/home/data/models/products/main_products_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, MainResponseModel<Banners>>> getBanners();
  Future<Either<Failure, MainResponseModel<CategoriesModel>>> getCategories();
  Future<Either<Failure, MainProductsResponse>> getProducts();
  Future<Either<Failure, ProductDetails>> getSingleProduct(
      String productId, String productVariationId);
}
