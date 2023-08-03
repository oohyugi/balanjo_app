import 'package:balanjo_app/src/features/home/model/src/flash_sale_model.dart';
import 'package:balanjo_app/src/shared/data/local/dao/product_dao.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/product_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import '../../../../shared/data/network/response/product_response.dart';
import '../../../../shared/model/model.dart';
import '../../../../utils/sync_server.dart';

abstract class IHomeRepository {
  Future<List<ProductModel>> fetchForyouProduct();

  Future<FlashSaleModel> fetchFlashSale();
}

class HomeRepository implements IHomeRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  final ProductLocalDataSource productLocalDataSource;

  HomeRepository(this.productRemoteDataSource, this.productLocalDataSource);

  @override
  Future<List<ProductModel>> fetchForyouProduct() async {
    final Result<List<ProductModel>> result = await syncData<List<ProductModel>,
            List<ProductResponse>, List<ProductDao>>(
        request: () async =>
            await productRemoteDataSource.fetchProductBySection(2),
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

  @override
  Future<FlashSaleModel> fetchFlashSale() async {
    String? startDate = "";
    String? endDate = "";

    final Result<List<ProductModel>> result = await syncData<List<ProductModel>,
        List<ProductResponse>, List<ProductDao>>(
      request: () async =>
          await productRemoteDataSource.fetchProductBySection(1),
      local: productLocalDataSource.getAllProducts,
      saveToLocal: (networkData) async {
        await productLocalDataSource.saveAllProducts(networkData);
      },
      mapper: (e) {
        startDate = e.firstOrNull?.section?.startDate?.orEmpty;
        endDate = e.firstOrNull?.section?.endDate?.orEmpty;
        return e
            .where((element) => element.section?.id == 1)
            .map((e) => ProductModel.fromLocal(e))
            .toList();
      },
    );

    return Future.value(FlashSaleModel(
        id: 1,
        startDate: startDate.orEmpty,
        endDate: endDate.orEmpty,
        isShow: _isShowFlashSale(
            DateTime.parse(startDate.orEmpty), DateTime.parse(endDate.orEmpty)),
        products: result.data));
  }

  bool _isShowFlashSale(DateTime startDateMil, DateTime endDateMil) {
    final start = startDateMil.millisecondsSinceEpoch;
    final now = DateTime.now().millisecondsSinceEpoch;
    final end = endDateMil.millisecondsSinceEpoch;
    return start < now && now <= end;
  }
}
