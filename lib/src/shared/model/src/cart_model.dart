import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final List<CartItem> items;
  final int totalItem;
  final double totalEstimatedPrice;

  const CartModel({
    required this.items,
    required this.totalEstimatedPrice,
    required this.totalItem,
  });

  @override
  List<Object?> get props => [items, totalEstimatedPrice, totalItem];
}

class CartItem extends Equatable {
  final int qty;
  final int productId;
  final double estimatePrice;

  const CartItem(
      {required this.qty,
      required this.productId,
      required this.estimatePrice});

  @override
  List<Object?> get props => [];
}
