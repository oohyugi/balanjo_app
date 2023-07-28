import 'package:balanjo_app/src/shared/data/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../utils/UiState.dart';
import '../../../model/model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepository}) : super(const CartState.initial());
  final CartRepository cartRepository;

  void addItem(ProductModel product) {
    final mState = state;
    if (mState.uiState.isSuccess) {
      final newProduct = ProductModel(
          imageUrl: product.imageUrl,
          title: product.title,
          discountPercent: product.discountPercent,
          basePrice: product.basePrice,
          discountPrice: product.discountPrice,
          id: product.id,
          qty: 1);

      final updatedCart = List<ProductModel>.from(mState.products)
        ..add(newProduct);

      cartRepository.increment(
          product.id,
          product.maxQty,
          product.discountPrice == 0
              ? product.basePrice
              : product.discountPrice);
      emit(CartState.success(products: updatedCart));
    }
  }

  void increment(ProductModel product) {
    if (product.qty < product.maxQty) {
      cartRepository.increment(
          product.id,
          product.maxQty,
          product.discountPrice == 0
              ? product.basePrice
              : product.discountPrice);
      _updateQty(product, product.qty + 1);
    }
  }

  void decrement(ProductModel product) {
    cartRepository.decrement(product.id,
        product.discountPrice == 0 ? product.basePrice : product.discountPrice);
    if (product.qty > 1) {
      _updateQty(product, product.qty - 1);
    } else {
      _removeProduct(product);
    }
  }

  void fetchCarts() {
    emit(const CartState.success(products: []));
  }

  void _removeProduct(ProductModel product) {
    var mState = state;
    if (mState.uiState.isSuccess) {
      mState.products.remove(product);
      var products = mState.products;

      emit(const CartState.initial());
      emit(CartState.success(products: products));
    }
  }

  void _updateQty(ProductModel product, int qty) {
    var mState = state;
    if (mState.uiState.isSuccess) {
      emit(const CartState.initial());
      var newProduct = ProductModel(
          imageUrl: product.imageUrl,
          title: product.title,
          discountPercent: product.discountPercent,
          basePrice: product.basePrice,
          discountPrice: product.discountPrice,
          id: product.id,
          qty: qty);

      mState.products[mState.products
          .indexWhere((element) => element.id == product.id)] = newProduct;
      emit(CartState.success(products: mState.products));
    }
  }
}
