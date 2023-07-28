import 'package:balanjo_app/src/features/order_confirmation/model/model.dart';
import 'package:balanjo_app/src/shared/data/local/dao/cart_dao.dart';
import 'package:balanjo_app/src/shared/data/local/service/cart_local_service.dart';
import 'package:balanjo_app/src/shared/model/model.dart';

abstract class IOrderRepository {
  Future<List<ProductModel>> fetchListCart();

  Future<SummaryOrderMdl> fetchOrderSummary();
}

class OrderRepository implements IOrderRepository {
  final CartLocalService cartLocalService;

  OrderRepository({required this.cartLocalService});

  @override
  Future<List<ProductModel>> fetchListCart() async {
    final carts = await cartLocalService.getAlCart();
    List<ProductModel> productsInCart = listProductInCart(carts);

    return Future.value(productsInCart);
  }

  @override
  Future<SummaryOrderMdl> fetchOrderSummary() async {
    final carts = await cartLocalService.getAlCart();

    List<ProductModel> productsInCart = listProductInCart(carts);

    var totalItem =
        carts.fold(0, (previousValue, element) => previousValue + element.qty);

    double totalEstimatedPrice = carts.fold(
        0.0, (previousValue, element) => previousValue + element.estimatePrice);

    double discountPrice = productsInCart.fold(
        0,
        (previousValue, element) =>
            previousValue +
            ((element.discountPrice != 0
                    ? element.discountPrice
                    : element.basePrice) *
                element.qty));

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

  List<ProductModel> listProductInCart(List<CartDao> carts) {
    var list = ProductModel.list() +
        ProductModel.dummiesFlashSale() +
        ProductModel.dummiesForyou();

    final List<ProductModel> productsInCart = List.empty(growable: true);
    var productIds = carts.map((e) => e.productId).toList();

    for (var product in list) {
      if (productIds.any((element) => element == product.id)) {
        productsInCart.add(ProductModel(
            imageUrl: product.imageUrl,
            title: product.title,
            discountPercent: product.discountPercent,
            basePrice: product.basePrice,
            discountPrice: product.discountPrice,
            id: product.id,
            qty: carts
                .firstWhere((element) => element.productId == product.id)
                .qty));
      }
    }
    return productsInCart;
  }
}
