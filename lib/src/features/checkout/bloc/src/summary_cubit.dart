
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/UiState.dart';
import '../../data/repository/checkout_repository.dart';
import '../../model/model.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit({required this.checkoutRepository})
      : super(const SummaryState.loading());

  final CheckoutRepository checkoutRepository;

  getSummaryOrder() async {
    emit(const SummaryState.loading());
    var summaryOrder = await checkoutRepository.fetchOrderSummary();
    emit(SummaryState.success(summaryOrder));
  }
}
