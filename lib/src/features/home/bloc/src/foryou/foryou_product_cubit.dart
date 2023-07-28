import 'package:balanjo_app/src/features/home/data/repository/repository.dart';
import 'package:balanjo_app/src/shared/data/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/model/src/product_model.dart';

part 'foryou_product_state.dart';

class ForyouProductCubit extends Cubit<ForyouProductState> {
  ForyouProductCubit(
      {required this.productRepository, required this.cartRepository})
      : super(ForyouProductInitial());

  final ProductRepository productRepository;
  final CartRepository cartRepository;

  void fetchProduct() async {
    emit(ForyouProductInitial());
    final products = await productRepository.fetchForyouProduct();
    emit(ForyouProductLoaded(products: products));
  }
}
