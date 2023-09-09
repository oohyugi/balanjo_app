import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/model.dart';
import '../../../repository/repository.dart';

part 'flash_sale_state.dart';

class FlashSaleCubit extends Cubit<FlashSaleState> {
  FlashSaleCubit({required this.homeRepository})
      : super(const FlashSaleState.loading());

  final HomeRepository homeRepository;

  void fetchProduct() async {
    var repo = await homeRepository.fetchFlashSale();
    emit(FlashSaleState.success(repo));
  }

  void hideFlashSale() async {
    await homeRepository.fetchFlashSale();
    emit(const FlashSaleState.failure());
  }
}
