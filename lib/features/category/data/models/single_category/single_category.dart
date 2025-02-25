import 'package:costly/features/category/data/models/categories_model.dart';

class SingleCategory {
  CategoriesModel? categoriesModel;
  bool? status;
  int? code;
  dynamic messages;

  SingleCategory({this.categoriesModel, this.status, this.code, this.messages});

  factory SingleCategory.fromJson(Map<String, dynamic> json) {
    return SingleCategory(
      categoriesModel: json['payload'] == null
          ? null
          : CategoriesModel.fromJson(json['payload'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
      messages: json['messages'] as dynamic,
    );
  }
}
