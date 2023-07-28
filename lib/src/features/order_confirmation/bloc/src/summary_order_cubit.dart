import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/model/model.dart';
import '../../../../utils/UiState.dart';
import '../../model/model.dart';

part 'summary_order_state.dart';

class SummaryOrderCubit extends Cubit<SummaryOrderState> {
  SummaryOrderCubit() : super(const SummaryOrderState.loading());

  final double _deliveryFee = 10000;

  getSummaryOrder(List<ProductModel> products) {
    var totalItem = products.fold(
        0, (previousValue, element) => previousValue + element.qty);

    double estimatePrice = products.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.basePrice * element.qty));

    double discountPrice = products.fold(
        0,
        (previousValue, element) =>
            previousValue +
            ((element.discountPrice != 0
                    ? element.discountPrice
                    : element.basePrice) *
                element.qty));

    double discountTotal = estimatePrice - discountPrice;

    final totalPrice = (estimatePrice - discountTotal) + _deliveryFee;

    emit(SummaryOrderState.success(SummaryOrderMdl(
        id: "1",
        totalItem: totalItem,
        subTotal: estimatePrice,
        totalPrice: totalPrice,
        totalDiscount: discountTotal,
        deliveryFee: _deliveryFee)));
  }
}
