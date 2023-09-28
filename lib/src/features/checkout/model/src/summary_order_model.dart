import 'package:equatable/equatable.dart';

class SummaryOrderMdl extends Equatable {
  final String id;
  final int totalItem;
  final double estimatedPrice;
  final double totalPrice;
  final double deliveryFee;
  final double serviceFee;
  final double totalDiscount;

  const SummaryOrderMdl(
      {required this.id,
      required this.totalItem,
      required this.estimatedPrice,
      required this.totalPrice,
      required this.deliveryFee,
      required this.serviceFee,
      required this.totalDiscount});

  @override
  List<Object?> get props => [
        id,
        totalItem,
        estimatedPrice,
        totalPrice,
        deliveryFee,
        serviceFee,
        totalDiscount
      ];
}
