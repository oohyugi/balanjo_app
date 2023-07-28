import 'package:balanjo_app/src/features/home/data/repository/repository.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/model.dart';

part 'flash_sale_state.dart';

class FlashSaleCubit extends Cubit<FlashSaleState> {
  FlashSaleCubit({required this.productRepository})
      : super(const FlashSaleState.loading());

  final ProductRepository productRepository;

  void fetchProduct() async {
    var repo = await productRepository.fetchFlashSale();
    emit(FlashSaleState.success(repo));
  }

  void hideFlashSale() async {
    var repo = await productRepository.fetchFlashSale();
    logDebug("hide", "ggg");
    emit(const FlashSaleState.failure());
  }
}
