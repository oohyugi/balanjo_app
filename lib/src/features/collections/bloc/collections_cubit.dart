import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../shared/model/src/product_model.dart';

part 'collections_state.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  CollectionsCubit() : super(const CollectionsState.initial());

  void fetchProduct(String categoryId) {
    emit(CollectionsState.success(products: ProductModel.list()));
  }
}
