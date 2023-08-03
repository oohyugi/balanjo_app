import 'package:balanjo_app/src/shared/data/local/dao/product_dao.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/product_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/response/product_response.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/sync_server.dart';

abstract class ICollectionRepository {
  Future<List<ProductModel>> fetchProducts(int categoryId);
}

class CollectionRepository implements ICollectionRepository {
  CollectionRepository(
      {required this.productRemoteDataSource,
      required this.productLocalDataSource});

  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;

  @override
  Future<List<ProductModel>> fetchProducts(int categoryId) async {
    final Result<List<ProductModel>> result = await syncData<List<ProductModel>,
        List<ProductResponse>, List<ProductDao>>(
      request: () async =>
          await productRemoteDataSource.fetchProductsByCategory(categoryId),
      local: productLocalDataSource.getAllProducts,
      saveToLocal: (networkData) async {
        await productLocalDataSource.saveAllProducts(networkData);
      },
      mapper: (e) {
        return e
            .where((element) => element.categoryId == categoryId)
            .map((e) => ProductModel.fromLocal(e))
            .toList();
      },
    );
    return result.data;
  }
}
