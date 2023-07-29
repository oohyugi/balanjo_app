import 'package:balanjo_app/src/features/order_confirmation/model/model.dart';
import 'package:balanjo_app/src/shared/data/local/dao/cart_dao.dart';
import 'package:balanjo_app/src/shared/data/local/service/cart_local_service.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';

abstract class IOrderRepository {
  Future<List<ProductModel>> fetchListCart();

  Future<SummaryOrderMdl> fetchOrderSummary();
}

class OrderRepository implements IOrderRepository {
  final CartLocalService cartLocalService;
  final ProductRemoteDataSource productRemoteDataSource;

  OrderRepository(
      {required this.cartLocalService, required this.productRemoteDataSource});

  @override
  Future<List<ProductModel>> fetchListCart() async {
    final carts = await cartLocalService.getAlCart();
    return await _getProductInCart(carts);
  }

  @override
  Future<SummaryOrderMdl> fetchOrderSummary() async {
    final carts = await cartLocalService.getAlCart();

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

    final totalPrice = (totalEstimatedPrice - discountTotal) + 10000;
    return Future.value(SummaryOrderMdl(
        id: "",
        totalItem: totalItem,
        estimatedPrice: totalEstimatedPrice,
        totalPrice: totalPrice,
        deliveryFee: 10000,
        totalDiscount: discountTotal));
  }

  Future<List<ProductModel>> _getProductInCart(List<CartDao> carts) async {
    final carts = await cartLocalService.getAlCart();

    if (carts.isEmpty) return [];
    final productsInCart = await productRemoteDataSource
        .fetchProductsByIds(carts.map((e) => e.productId).toList());

    return productsInCart
        .map((e) => e.toProductModel(
            qty: carts.firstWhere((element) => element.productId == e.id).qty))
        .toList();
  }
}
