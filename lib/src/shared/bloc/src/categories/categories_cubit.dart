import 'package:balanjo_app/src/shared/data/repository/src/category_repository.dart';
import 'package:balanjo_app/src/shared/model/src/category_model.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoryRepository)
      : super(const CategoriesState.initial());
  final CategoryRepository categoryRepository;

  void fetchCategories() async {
    emit(const CategoriesState.initial());
    final result = await categoryRepository.fetchCategories();
    emit(CategoriesState.success(categories: result));
  }
}
