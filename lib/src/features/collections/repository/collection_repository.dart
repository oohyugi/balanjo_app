import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/shared/model/model.dart';


abstract class ICollectionRepository {
  Future<List<ProductModel>> fetchProducts(int categoryId);
}

class CollectionRepository implements ICollectionRepository {
  CollectionRepository({required this.productRemoteDataSource});

  final ProductRemoteDataSource productRemoteDataSource;

  @override
  Future<List<ProductModel>> fetchProducts(int categoryId) async {
    final response = await productRemoteDataSource.fetchProductsByCategory(categoryId);

   return response.map((e) =>e.toProductModel()).toList();
  }
}

