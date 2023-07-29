import 'package:balanjo_app/config/db.dart';
import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/data/local/service/cart_local_service.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/shared/data/repository/repository.dart';

import '../data/network/product/product_service.dart';


void categoriesModule() {
  getIt.registerFactory(() => IsarDb());
  getIt.registerFactory(() => CartLocalService(getIt()));
  getIt.registerLazySingleton(() => ProductService());

  getIt.registerLazySingleton(
      () => ProductRemoteDataSource(productService: getIt()));

  getIt.registerLazySingleton(() => CartRepository(cartLocalService: getIt()));

  getIt.registerFactory(() => CategoriesCubit());
  getIt.registerFactory(() => CartCubit(cartRepository: getIt()));
}
