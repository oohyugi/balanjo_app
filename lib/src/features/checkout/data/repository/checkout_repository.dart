import 'package:balanjo_app/src/shared/data/local/dao/cart_dao.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/cart_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/shared/model/model.dart';

import '../../model/model.dart';

abstract class ICheckoutRepository {
  Future<List<ProductModel>> fetchListCart();

  Future<SummaryOrderMdl> fetchOrderSummary();
}

class CheckoutRepository implements ICheckoutRepository {
  final CartLocalDataSource cartLocalDataSource;
  final ProductRemoteDataSource productRemoteDataSource;

  CheckoutRepository(
      {required this.cartLocalDataSource,
      required this.productRemoteDataSource});

  @override
  Future<List<ProductModel>> fetchListCart() async {
    final carts = await cartLocalDataSource.getAlCart();
    return await _getProductInCart(carts);
  }

  @override
  Future<SummaryOrderMdl> fetchOrderSummary() async {
    final carts = await cartLocalDataSource.getAlCart();

    List<ProductModel> productsInCart = await _getProductInCart(carts);

    var totalItem =
        carts.fold(0, (previousValue, element) => previousValue + element.qty);

    double totalEstimatedPrice = carts.fold(
        0.0, (previousValue, element) => previousValue + element.estimatePrice);

    double discountPrice = productsInCart.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.displayPrice * element.qty));

    double basePrice = productsInCart.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.basePrice * element.qty));

    double discountTotal = basePrice - discountPrice;

    final totalPrice = totalEstimatedPrice + 10000 + 2000;
    return Future.value(SummaryOrderMdl(
        id: "",
        totalItem: totalItem,
        estimatedPrice: totalEstimatedPrice,
        totalPrice: totalPrice,
        deliveryFee: 10000,
        serviceFee: 2000,
        totalDiscount: discountTotal));
  }

  Future<List<ProductModel>> _getProductInCart(List<CartDao> carts) async {
    final carts = await cartLocalDataSource.getAlCart();

    if (carts.isEmpty) return [];
    final productsInCart = await productRemoteDataSource
        .fetchProductsByIds(carts.map((e) => e.productId).toList());

    return productsInCart
        .map((e) => ProductModel.fromApi(
            res: e,
            qty: carts.firstWhere((element) => element.productId == e.id).qty))
        .toList();
  }
}
