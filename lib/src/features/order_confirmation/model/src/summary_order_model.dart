import 'package:equatable/equatable.dart';

class SummaryOrderMdl extends Equatable {
  final String id;
  final int totalItem;
  final double subTotal;
  final double totalPrice;
  final double deliveryFee;
  final double totalDiscount;

  const SummaryOrderMdl(
      {required this.id,
      required this.totalItem,
      required this.subTotal,
      required this.totalPrice,
      required this.deliveryFee,
      required this.totalDiscount});

  @override
  List<Object?> get props =>
      [id, totalItem, subTotal, totalPrice, deliveryFee, totalDiscount];
}
