import 'package:balanjo_app/src/shared/data/local/dao/product_dao.dart';
import 'package:balanjo_app/src/shared/data/network/response/product_response.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String imageUrl;
  final String title;
  final int discountPercent;
  final double basePrice;
  final double displayPrice;
  final int id;
  final bool isFavorite;
  final int qty;
  final int maxQty;

  const ProductModel(
      {required this.imageUrl,
      required this.title,
      required this.discountPercent,
      required this.basePrice,
      required this.displayPrice,
      required this.id,
      this.isFavorite = false,
      this.qty = 0,
      this.maxQty = 0});

  static List<ProductModel> list() {
    List<ProductModel> list = List.empty(growable: true);
    for (var i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        list.add(ProductModel(
            id: i,
            imageUrl:
                "https://ik.imagekit.io/dcjlghyytp1/2f172f211ebf9309d2701ea208e36846?tr=f-auto,w-200",
            title: "Bawang Bombai 1kg",
            discountPercent: 0,
            basePrice: 15000,
            displayPrice: 0));
      } else {
        list.add(ProductModel(
            id: i,
            imageUrl:
                "https://ik.imagekit.io/dcjlghyytp1/8211ef614d79ca2aa0231dfd21e8ea5a?tr=f-auto,w-200",
            title: "Daging Segar",
            discountPercent: 5,
            basePrice: 35000,
            displayPrice: 30000));
      }
    }
    return list;
  }

  static List<ProductModel> dummiesFlashSale() {
    List<ProductModel> list = List.empty(growable: true);
    for (var i = 0; i < 10; i++) {
      list.add(ProductModel(
          id: "Semangka Merah $i".hashCode,
          imageUrl:
              "https://ik.imagekit.io/dcjlghyytp1/bef82bea4165199a388c37058e38325a?tr=f-auto,w-200",
          title: "Semangka Merah $i",
          discountPercent: 15,
          basePrice: 41900 * (i + 1).toDouble(),
          displayPrice: 40000 * (i + 1).toDouble()));
    }
    return list;
  }

  static List<ProductModel> dummiesForyou() {
    List<ProductModel> list = List.empty(growable: true);
    for (var i = 0; i < 10; i++) {
      list.add(ProductModel(
          id: "Jeruk Import $i".hashCode,
          imageUrl:
              "https://ik.imagekit.io/dcjlghyytp1/308cd424e2fd009d4c2037962848b7ec?tr=f-auto,w-200",
          title: "Jeruk Import $i",
          discountPercent: 15,
          basePrice: 21900 * (i + 1).toDouble(),
          displayPrice: 20000 * (i + 1).toDouble()));
    }
    return list;
  }

  @override
  List<Object?> get props => [id, qty, maxQty];

  static ProductModel fromLocal(ProductDao e) {
    return ProductModel(
        basePrice: e.price?.basePrice?.toDouble() ?? 0,
        discountPercent: e.price?.discount ?? 0,
        displayPrice: getDisplayPriceLocal(e.price),
        imageUrl: e.imageUrl.orEmpty,
        id: e.id ?? -1,
        maxQty: e.stock ?? 0,
        qty: 0,
        title: e.name.orEmpty);
  }

  static ProductModel fromApi({required ProductResponse res, int qty = 0}) {
    return ProductModel(
        basePrice: res.price?.basePrice?.toDouble() ?? 0,
        discountPercent: res.price?.discount ?? 0,
        displayPrice: getDisplayPrice(res.price),
        imageUrl: res.imageUrl.orEmpty,
        id: res.id ?? -1,
        maxQty: res.stock ?? 0,
        qty: qty,
        title: res.name.orEmpty);
  }
}

double getDisplayPrice(PriceResponse? price) {
  if (price != null) {
    if (price.offerPrice != 0) {
      return price.offerPrice!.toDouble();
    } else {
      return price.basePrice!.toDouble();
    }
  } else {
    return 0;
  }
}

double getDisplayPriceLocal(Price? price) {
  if (price != null) {
    if (price.offerPrice != 0) {
      return price.offerPrice!.toDouble();
    } else {
      return price.basePrice!.toDouble();
    }
  } else {
    return 0;
  }
}
