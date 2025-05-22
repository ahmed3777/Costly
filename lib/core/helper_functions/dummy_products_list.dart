import 'package:costly/features/products/data/models/products/main_variation.dart';
import 'package:costly/features/products/data/models/products/product.dart';

List<Product> dummyProducts() {
  return List.generate(
    6,
    (index) => Product(
      id: "",
      enName: "",
      arName: "",
      arSlug: "",
      enSlug: "",
      mainVariationPrice: 0,
      status: "",
      creatorId: '',
      mainMediaUrl: '',
      mainVariation: MainVariation(
        id: '',
        price: 0,
        priceAfterDiscount: 0,
        // باقي الخصائص لو في، حسب ما يتطلب الموديل
      ),
    ),
  );
}
