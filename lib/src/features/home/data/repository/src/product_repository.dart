import 'dart:math';

import 'package:balanjo_app/src/features/home/model/src/flash_sale_model.dart';
import 'package:balanjo_app/src/utils/extensions/date.dart';
import 'package:balanjo_app/src/utils/log.dart';

import '../../../../../shared/model/model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> fetchForyouProduct();

  Future<FlashSaleModel> fetchFlashSale();
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductModel>> fetchForyouProduct() {
    return Future.value(_dummies());
  }

  List<ProductModel> _dummies() {
    List<ProductModel> list = List.empty(growable: true);
    for (var i = 0; i < 10; i++) {
      list.add(ProductModel(
          id: i,
          imageUrl:
              "https://sesa.id/cdn/shop/products/pete-kupas-web_300x@2x.jpg?v=1674791258",
          title: "Salmon Premium Fillet Fresh",
          discountPercent: "-15%",
          basePrice: 10000*(i+1).toDouble(),
          discountPrice: 8000*(i+1).toDouble()));
    }
    return list;
  }

  @override
  Future<FlashSaleModel> fetchFlashSale() {
    const startDate = "2023-07-24 14:57:00";
    const endDate = "2023-07-29 15:59:00";

    return Future.value(FlashSaleModel(
        id: "1",
        startDate: startDate,
        endDate: endDate,
        isShow: _isShowFlashSale(
            DateTime.parse(startDate), DateTime.parse(endDate)),
        products: _dummies()));
  }

  bool _isShowFlashSale(DateTime startDateMil, DateTime endDateMil) {
    final start = startDateMil.millisecondsSinceEpoch;
    final now = DateTime.now().millisecondsSinceEpoch;
    final end = endDateMil.millisecondsSinceEpoch;
    return start < now && now <= end;
  }
}
