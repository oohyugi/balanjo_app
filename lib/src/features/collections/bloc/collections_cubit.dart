import 'package:balanjo_app/src/features/collections/repository/collection_repository.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../shared/model/src/product_model.dart';

part 'collections_state.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  CollectionsCubit({required this.collectionRepository})
      : super(const CollectionsState.initial());

  final CollectionRepository collectionRepository;

  void fetchProduct(int categoryId) async {
    emit(const CollectionsState.initial());
    final response = await collectionRepository.fetchProducts(categoryId);
    if (response.isEmpty) {
      emit(const CollectionsState.failure());
    } else {
      emit(CollectionsState.success(products: response));
    }
  }
}
