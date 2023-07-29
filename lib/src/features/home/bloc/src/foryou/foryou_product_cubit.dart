import 'package:balanjo_app/src/shared/data/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/model/src/product_model.dart';
import '../../../repository/repository.dart';

part 'foryou_product_state.dart';

class ForyouProductCubit extends Cubit<ForyouProductState> {
  ForyouProductCubit(
      {required this.homeRepository, required this.cartRepository})
      : super(ForyouProductInitial());

  final HomeRepository homeRepository;
  final CartRepository cartRepository;

  void fetchProduct() async {
    emit(ForyouProductInitial());
    final products = await homeRepository.fetchForyouProduct();
    emit(ForyouProductLoaded(products: products));
  }
}
