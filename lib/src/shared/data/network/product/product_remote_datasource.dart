import 'package:balanjo_app/src/shared/data/network/product/product_service.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:dio/dio.dart';

import '../response/product_response.dart';

abstract class IProductRemoteDataSource {
  Future<List<ProductResponse>> fetchProductsByIds(List<int> productIds);

  Future<List<ProductResponse>> fetchProductsByCategory(int categoryId);

  Future<List<ProductResponse>> fetchProductBySection(int sectionId);
}

class ProductRemoteDataSource implements IProductRemoteDataSource {
  ProductRemoteDataSource({required this.productService});

  final ProductService productService;

  @override
  Future<List<ProductResponse>> fetchProductsByIds(List<int> productIds) async {
    try {
      final response = await productService.fetchProductByIds(productIds);
      return (response.data as List)
          .map((e) => ProductResponse.fromJson(e))
          .toList();
    } on DioException catch (e) {
      logDebug(tag: "error", message: e.message);
      return [];
    }
  }

  @override
  Future<List<ProductResponse>> fetchProductsByCategory(int categoryId) async {
    try {
      final response = await productService.fetchProductsByCategory(categoryId);
      return (response.data as List)
          .map((e) => ProductResponse.fromJson(e))
          .toList();
    } on DioException catch (e) {
      logDebug(tag: "error", message: e.message);
      return [];
    }
  }

  @override
  Future<List<ProductResponse>> fetchProductBySection(int sectionId) async {
    try {
      final response = await productService.fetchProductsBySection(sectionId);
      return (response.data as List)
          .map((e) => ProductResponse.fromJson(e))
          .toList();
    } on DioException catch (e) {
      logDebug(tag: "error", message: e.message);
      return [];
    }
  }
}
