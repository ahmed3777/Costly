import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/products/data/models/product_details/product_details.dart';
import 'package:dartz/dartz.dart';

import '../data/models/products/main_products_response.dart';

abstract class ProductsRepo {
  Future<Either<Failure, MainProductsResponse>> getProducts({
    bool? mostPopular,
    bool? mostRecently,
    bool? highestRated,
    bool? priceLow,
    bool? priceHigh,
  });
  Future<Either<Failure, ProductDetails>> getSingleProduct(
      String productId, String productVariationId);

  Future<Either<Failure, MainProductsResponse>> getProductsByCategory(
      {required String categoryId});
}
