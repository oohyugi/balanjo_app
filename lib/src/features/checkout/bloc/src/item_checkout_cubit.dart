import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/UiState.dart';
import '../../data/repository/checkout_repository.dart';

part 'item_checkout_state.dart';

class ItemCheckoutCubit extends Cubit<ItemCheckoutState> {
  ItemCheckoutCubit({required this.checkoutRepository})
      : super(const ItemCheckoutState.loading());

  final CheckoutRepository checkoutRepository;

  void fetchItemsOrder() async {
    final items = await checkoutRepository.fetchListCart();
    emit(ItemCheckoutState.success(items));
  }
}
