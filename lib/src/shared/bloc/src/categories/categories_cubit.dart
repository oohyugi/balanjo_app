import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../model/src/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(const CategoriesState.initial());

  void fetchCategories() {
    emit(
        CategoriesState.success(categories: CategoriesModel.categoriesDummy()));
  }
}
