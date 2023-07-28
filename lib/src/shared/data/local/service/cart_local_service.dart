import 'package:balanjo_app/config/db.dart';
import 'package:isar/isar.dart';
import '../dao/cart_dao.dart';

class CartLocalService {
  final IsarDb isarDb;

  CartLocalService(this.isarDb);

  Future<void> saveToCart(CartDao cart) async {
    final isar = await isarDb.db;
    isar.writeTxnSync<int>(() => isar.cartDaos.putSync(cart));
  }

  Future<void> saveProductToCart(CartDao cart) async {
    final isar = await isarDb.db;
    final result =
        isar.cartDaos.filter().productIdEqualTo(cart.productId).findFirstSync();

    isar.writeTxnSync<int>(() => isar.cartDaos.putSync(result != null
        ? (result
          ..qty = cart.qty
          ..estimatePrice = cart.estimatePrice)
        : cart));
  }

  Future<void> removeCart(int productId) async {
    final isar = await isarDb.db;
    final result =
        isar.cartDaos.filter().productIdEqualTo(productId).findFirstSync();

    if (result != null) {
      isar.writeTxnSync(() => isar.cartDaos.deleteSync(result.id));
    }
  }

  Future<List<CartDao>> getAllProductFromCart() async {
    final isar = await isarDb.db;
    return isar.cartDaos.where().findAll();
  }

  Future<CartDao?> getCartByProductId(int id) async {
    final isar = await isarDb.db;
    return isar.cartDaos.filter().productIdEqualTo(id).findFirstSync();
  }
}
