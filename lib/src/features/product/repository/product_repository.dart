import 'package:balanjo_app/src/shared/model/model.dart';

import '../../../shared/data/local/dao/product_dao.dart';
import '../../../shared/data/local/datasource/product_local_datasource.dart';
import '../../../shared/data/network/product/product_remote_datasource.dart';
import '../../../shared/data/network/response/product_response.dart';
import '../../../utils/sync_server.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> fetchProductSection(int id);
}

class ProductRepository implements IProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  final ProductLocalDataSource productLocalDataSource;

  ProductRepository(this.productRemoteDataSource, this.productLocalDataSource);

  @override
  Future<List<ProductModel>> fetchProductSection(int id) async {
    final Result<List<ProductModel>> result = await syncData<List<ProductModel>,
            List<ProductResponse>, List<ProductDao>>(
        request: () async =>
            await productRemoteDataSource.fetchProductBySection(id),
        local: productLocalDataSource.getAllProducts,
        saveToLocal: (networkData) async {
          await productLocalDataSource.saveAllProducts(networkData);
        },
        mapper: (local) {
          return local
              .where((element) => element.section?.id == 2)
              .map((e) => ProductModel.fromLocal(e))
              .toList();
        });
    return result.data;
  }
}
