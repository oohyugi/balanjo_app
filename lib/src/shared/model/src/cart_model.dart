import 'package:equatable/equatable.dart';

import '../model.dart';

class CartModel extends Equatable {
  final String id;
  final List<ProductModel> products;
  final int totalItem;
  final String estimatePrice;
  final String totalPrice;
  final String deliveryFee;

  const CartModel(
      {required this.id,
      required this.products,
      required this.estimatePrice,
      required this.totalItem,
      required this.totalPrice,
      required this.deliveryFee});

  @override
  List<Object?> get props =>
      [id, totalPrice, products, estimatePrice, totalPrice, deliveryFee];
}
