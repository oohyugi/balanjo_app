import 'package:balanjo_app/src/shared/data/local/service/cart_local_service.dart';
import 'package:balanjo_app/src/utils/log.dart';

import '../../../model/model.dart';
import '../../local/dao/cart_dao.dart';

abstract class ICartRepository {
  Future<void> increment(int id, int maxQty, double estimatePrice);

  Future<void> decrement(int id,double estimatePrice);

  Future<List<ProductModel>> getCarts();
}

class CartRepository implements ICartRepository {
  final CartLocalService cartLocalService;

  CartRepository({required this.cartLocalService});

  @override
  Future<void> decrement(int id,double estimatePrice) async {
    final item = await cartLocalService.getCartByProductId(id);
    if (item != null && item.qty > 1) {
      int qty = item.qty;
      qty--;
      cartLocalService.saveProductToCart(
          CartDao(qty: qty, productId: id, estimatePrice: estimatePrice*qty));
    } else {
      logDebug("remove", "gaga");
      cartLocalService.removeCart(id);
    }
  }

  @override
  Future<List<ProductModel>> getCarts() {
    return Future.value(ProductModel.list());
  }

  @override
  Future<void> increment(int id, int maxQty, double estimatePrice) async {
    final item = await cartLocalService.getCartByProductId(id);
    if (item != null && item.qty < maxQty) {
      int qty = item.qty;
      qty++;

      cartLocalService.saveProductToCart(
          CartDao(qty: qty, productId: id, estimatePrice: estimatePrice*qty));
    } else {
      cartLocalService.saveProductToCart(
          CartDao(qty: 1, productId: id, estimatePrice: estimatePrice));
    }
  }
}
