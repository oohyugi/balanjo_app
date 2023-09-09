import 'package:balanjo_app/src/shared/data/repository/repository.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../utils/UiState.dart';
import '../../../model/model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepository}) : super(const CartState.initial());
  final CartRepository cartRepository;

  void increment(ProductModel product) async {
    await cartRepository.increment(
        product.id, product.maxQty, product.displayPrice);
    fetchCart();
  }

  void decrement(ProductModel product) async {
    await cartRepository.decrement(product.id, product.displayPrice);
    fetchCart();
  }

  void fetchCart() async {
    final cart = await cartRepository.getCarts();
    emit(CartState.success(cart: cart));
  }
}
