import 'package:balanjo_app/src/utils/log.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../shared/model/src/product_model.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());



  void getCategories() {
    emit(CatalogLoaded(products: ProductModel.list()));
  }
}
