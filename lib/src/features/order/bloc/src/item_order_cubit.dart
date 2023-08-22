import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/UiState.dart';
import '../../data/repository/order_repository.dart';

part 'item_order_state.dart';

class ItemOrderCubit extends Cubit<ItemOrderState> {
  ItemOrderCubit({required this.orderRepository})
      : super(const ItemOrderState.loading());

  final OrderRepository orderRepository;

  void fetchItemsOrder() async {
    final items = await orderRepository.fetchListCart();
    emit(ItemOrderState.success(items));
  }
}
