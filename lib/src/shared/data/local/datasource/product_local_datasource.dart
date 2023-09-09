import 'package:balanjo_app/config/isar_helper.dart';
import 'package:balanjo_app/src/shared/data/local/dao/product_dao.dart';
import 'package:balanjo_app/src/shared/data/network/response/product_response.dart';
import 'package:isar/isar.dart';

class ProductLocalDataSource {
  final IsarHelper _helper;

  ProductLocalDataSource(this._helper);

  Future<void> saveProduct(ProductResponse response) async {
    final isar = await _helper.db;
    isar.writeTxnSync<int>(
        () => isar.productDaos.putSync(ProductDao.fromApi(response)));
  }

  Future<void> saveAllProducts(List<ProductResponse> products) async {
    final isar = await _helper.db;

    final productDaos = products.map((e) => ProductDao.fromApi(e)).toList();
    isar.writeTxnSync<List<int>>(
        () => isar.productDaos.putAllSync(productDaos));
  }

  Future<List<ProductDao>> getAllProducts() async {
    final isar = await _helper.db;
    var result =
        isar.writeTxnSync(() => isar.productDaos.where().findAllSync());

    return result;
  }

  Future<List<ProductDao>> getAllProductsByCategoryId(int id,
      {int offset = 0}) async {
    final isar = await _helper.db;
    var result = isar.writeTxnSync(() => isar.productDaos
        .filter()
        .categoryIdEqualTo(id)
        .offset(offset)
        .limit(10)
        .findAllSync());

    return result;
  }
}
