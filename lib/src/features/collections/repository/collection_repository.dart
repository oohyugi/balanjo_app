import 'package:balanjo_app/src/shared/data/local/dao/product_dao.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/product_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/response/product_response.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/sync_server.dart';

abstract class ICollectionRepository {
  Future<List<ProductModel>> fetchProducts(int categoryId, String range,int offset);
}

class CollectionRepository implements ICollectionRepository {
  CollectionRepository(
      {required this.productRemoteDataSource,
      required this.productLocalDataSource});

  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;

  @override
  Future<List<ProductModel>> fetchProducts(int categoryId, String range,int offset) async {
   var network = await productRemoteDataSource
        .fetchProductsByCategory(categoryId, range);
    final Result<List<ProductModel>> result = await syncData<
        List<ProductModel>, List<ProductResponse>, List<ProductDao>>(
      request: () async =>network,
      local: () async =>
          await productLocalDataSource.getAllProductsByCategoryId(categoryId,offset: offset),
      saveToLocal: (networkData) async {
        await productLocalDataSource.saveAllProducts(networkData);
      },
      mapper: (l) {
        var local = l
            .where((element) => element.categoryId == categoryId)
            .map((e) => ProductModel.fromLocal(e))
            .toList();
        return local;
      },
    );
    return result.data;
  }
}
