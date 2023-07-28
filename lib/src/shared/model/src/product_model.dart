import 'dart:ffi';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String imageUrl;
  final String title;
  final String discountPercent;
  final double basePrice;
  final double discountPrice;
  final int id;
  final bool isFavorite;
  final int qty;
  final int maxQty;

  const ProductModel(
      {required this.imageUrl,
      required this.title,
      required this.discountPercent,
      required this.basePrice,
      required this.discountPrice,
      required this.id,
      this.isFavorite = false,
      this.qty = 0,
      this.maxQty = 10});

  static List<ProductModel> list() {
    List<ProductModel> list = List.empty(growable: true);
    for (var i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        list.add(ProductModel(
            id: i,
            imageUrl:
                "https://ik.imagekit.io/dcjlghyytp1/2f172f211ebf9309d2701ea208e36846?tr=f-auto,w-200",
            title: "Bawang Bombai 1kg",
            discountPercent: "",
            basePrice: 15000,
            discountPrice: 0));
      } else {
        list.add(ProductModel(
            id: i,
            imageUrl:
                "https://ik.imagekit.io/dcjlghyytp1/8211ef614d79ca2aa0231dfd21e8ea5a?tr=f-auto,w-200",
            title: "Daging Segar",
            discountPercent: "5%",
            basePrice: 35000,
            discountPrice: 30000));
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
          discountPercent: "-15%",
          basePrice: 41900*(i+1).toDouble(),
          discountPrice: 40000*(i+1).toDouble()));
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
          discountPercent: "-15%",
          basePrice: 21900*(i+1).toDouble(),
          discountPrice: 20000*(i+1).toDouble()));
    }
    return list;
  }

  @override
  List<Object?> get props => [id, qty, maxQty];
}
