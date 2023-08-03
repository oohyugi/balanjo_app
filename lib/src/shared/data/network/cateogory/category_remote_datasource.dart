import 'package:balanjo_app/src/shared/data/network/cateogory/category_service.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:dio/dio.dart';

import '../response/category_response.dart';

abstract class ICategoryRemoteDataSource {
  Future<List<CategoryResponse>> fetchCategories();

  Future<Response<List<CategoryResponse>>> fetchCategoriesExample();
}

class CategoryRemoteDataSource implements ICategoryRemoteDataSource {
  final CategoryService categoryService;

  CategoryRemoteDataSource(this.categoryService);

  @override
  Future<List<CategoryResponse>> fetchCategories() async {
    try {
      final response = await categoryService.fetchCategories();
      return (response.data as List)
          .map((e) => CategoryResponse.fromJson(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Response<List<CategoryResponse>>> fetchCategoriesExample() async {
    try {
      final response = await categoryService.fetchCategories();
      final datas = (response.data as List)
          .map((e) => CategoryResponse.fromJson(e))
          .toList();
      return Response(requestOptions: response.requestOptions, data: datas);
    } catch (e) {
      return Response(requestOptions: RequestOptions(path: ""), data: []);
    }
  }
}
