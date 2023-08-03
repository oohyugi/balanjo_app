import 'package:balanjo_app/src/shared/data/local/datasource/cart_local_datasource.dart';
import '../../../model/model.dart';
import '../../local/dao/cart_dao.dart';

abstract class ICartRepository {
  Future<void> increment(int id, int maxQty, double estimatePrice);

  Future<void> decrement(int id, double estimatePrice);

  Future<CartModel> getCarts();
}

class CartRepository implements ICartRepository {
  final CartLocalDataSource cartLocalDataSource;

  CartRepository(this.cartLocalDataSource);

  @override
  Future<void> decrement(int id, double estimatePrice) async {
    final item = await cartLocalDataSource.getCartByProductId(id);
    if (item != null && item.qty > 1) {
      int qty = item.qty - 1;

      cartLocalDataSource.saveProductToCart(
          CartDao(qty: qty, productId: id, estimatePrice: estimatePrice * qty));
    } else {
      cartLocalDataSource.removeCart(id);
    }
  }

  @override
  Future<CartModel> getCarts() async {
    final carts = await cartLocalDataSource.getAlCart();
    var totalItem =
        carts.fold(0, (previousValue, element) => previousValue + element.qty);

    double totalEstimatedPrice = carts.fold(
        0.0, (previousValue, element) => previousValue + element.estimatePrice);

    return CartModel(
      items: carts
          .map((e) => CartItem(
              qty: e.qty,
              productId: e.productId,
              estimatePrice: e.estimatePrice))
          .toList(),
      totalEstimatedPrice: totalEstimatedPrice,
      totalItem: totalItem,
    );
  }

  @override
  Future<void> increment(int id, int maxQty, double estimatePrice) async {
    final item = await cartLocalDataSource.getCartByProductId(id);
    if (item != null && item.qty < maxQty) {
      int qty = item.qty + 1;

      cartLocalDataSource.saveProductToCart(
          CartDao(qty: qty, productId: id, estimatePrice: estimatePrice * qty));
    } else {
      cartLocalDataSource.saveProductToCart(
          CartDao(qty: 1, productId: id, estimatePrice: estimatePrice));
    }
  }
}
