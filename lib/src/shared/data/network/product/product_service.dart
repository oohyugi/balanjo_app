import 'package:balanjo_app/src/api/dio/dio_config.dart';
import 'package:dio/dio.dart';

const defaultSelectProduct =
    "select=id,name,sku,image_url,desc,category_id,stock,price(base_price,discount,offer_price),tag_ids";

class ProductService {
  Future<Response> fetchProductsByCategory(int categoryId, String range) async {
    return addInterceptors(
            dio: createDio(), isRequireAuth: true, header: {"Range": range})
        .get("product?category_id=eq.$categoryId&$defaultSelectProduct");
  }

  Future<Response> fetchProductByIds(List<int> productIds) async {
    final productId = productIds
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");
    return addInterceptors(dio: createDio(), isRequireAuth: true)
        .get("product?id=in.($productId)&$defaultSelectProduct");
  }

  Future<Response> fetchProductsBySection(int sectionId) async {
    return addInterceptors(dio: createDio(), isRequireAuth: true).get(
        "product?section_id=eq.$sectionId&$defaultSelectProduct,section(id,name,start_date,end_date)");
  }

  Future<Response> fetchCategories() async {
    return addInterceptors(dio: createDio(), isRequireAuth: true)
        .get("category?select=id,name");
  }
}
