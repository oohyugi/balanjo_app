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

  var range = "0-9";

  void fetchProduct(int categoryId) async {
    if(state.products.isNotEmpty){
      range = "${state.products.length}-${state.products.length + 9}";
    }
    final response =
        await collectionRepository.fetchProducts(categoryId, range,state.products.length);
    if (response.isEmpty) {
      emit( CollectionsState.success(products: state.products, hasReachedMax: true));

    } else {
      var list = List.of(state.products)..addAll(response);
      emit(CollectionsState.success(products: list,hasReachedMax: response.length<10));
    }
  }
}
