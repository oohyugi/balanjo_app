import 'package:balanjo_app/src/features/home/model/src/flash_sale_model.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import '../../../../shared/model/model.dart';
import '../../../../utils/log.dart';

abstract class IHomeRepository {
  Future<List<ProductModel>> fetchForyouProduct();

  Future<FlashSaleModel> fetchFlashSale();
}

class HomeRepository implements IHomeRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  HomeRepository(this.productRemoteDataSource);

  @override
  Future<List<ProductModel>> fetchForyouProduct() async {
    final products = await productRemoteDataSource.fetchProductBySection(2);
    return products.map((e) => e.toProductModel()).toList();
  }

  @override
  Future<FlashSaleModel> fetchFlashSale() async {
    final products = await productRemoteDataSource.fetchProductBySection(1);
    final startDate = products.firstOrNull?.section?.startDate;
    final endDate = products.firstOrNull?.section?.endDate;


    return Future.value(FlashSaleModel(
        id: 1,
        startDate: startDate.orEmpty,
        endDate: endDate.orEmpty,
        isShow: _isShowFlashSale(
            DateTime.parse(startDate.orEmpty), DateTime.parse(endDate.orEmpty)),
        products: products.map((e) => e.toProductModel()).toList()));
  }

  bool _isShowFlashSale(DateTime startDateMil, DateTime endDateMil) {
    final start = startDateMil.millisecondsSinceEpoch;
    final now = DateTime.now().millisecondsSinceEpoch;
    final end = endDateMil.millisecondsSinceEpoch;
    return start < now && now <= end;
  }
}
