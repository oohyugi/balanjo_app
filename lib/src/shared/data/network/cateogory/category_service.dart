import 'package:balanjo_app/src/api/dio/dio_config.dart';
import 'package:dio/dio.dart';

const defaultCategoryPath =
    "category?select=id,name,image_url";

class CategoryService {
  Future<Response> fetchCategories() async {
    return addInterceptors(dio: createDio(), isRequireAuth: false)
        .get(defaultCategoryPath);
  }
}
