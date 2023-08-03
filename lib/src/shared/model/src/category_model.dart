import 'package:balanjo_app/src/shared/data/network/response/category_response.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';

import '../../data/local/dao/category_dao.dart';

class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;

  CategoryModel({required this.id, required this.name, required this.imageUrl});

  factory CategoryModel.fromResponse(CategoryResponse e) {
    return CategoryModel(
        id: e.id ?? 0, name: e.name.orEmpty, imageUrl: e.imageUrl.orEmpty);
  }

  factory CategoryModel.fromLocal(CategoryDao e) {
    return CategoryModel(
        id: e.id ?? 0, name: e.name.orEmpty, imageUrl: e.imageUrl.orEmpty);
  }
}
