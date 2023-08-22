
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/UiState.dart';
import '../../data/repository/order_repository.dart';
import '../../model/model.dart';

part 'summary_order_state.dart';

class SummaryOrderCubit extends Cubit<SummaryOrderState> {
  SummaryOrderCubit({required this.orderRepository})
      : super(const SummaryOrderState.loading());

  final OrderRepository orderRepository;

  getSummaryOrder() async {
    emit(const SummaryOrderState.loading());
    var summaryOrder = await orderRepository.fetchOrderSummary();
    emit(SummaryOrderState.success(summaryOrder));
  }
}
