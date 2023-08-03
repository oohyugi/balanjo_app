import 'package:balanjo_app/config/isar_helper.dart';
import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/category_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/cart_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/cateogory/category_remote_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/cateogory/category_service.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/shared/data/repository/repository.dart';
import 'package:balanjo_app/src/shared/data/repository/src/category_repository.dart';

import '../data/local/datasource/product_local_datasource.dart';
import '../data/network/product/product_service.dart';

void categoriesModule() {
  //local
  getIt.registerFactory(() => IsarHelper());
  getIt.registerFactory(() => CartLocalDataSource(getIt()));
  getIt.registerLazySingleton(() => CategoryLocalDataSource(getIt()));
  getIt.registerLazySingleton(() => ProductLocalDataSource(getIt()));

  //remote
  getIt.registerLazySingleton(() => ProductService());
  getIt.registerLazySingleton(() => CategoryService());

  getIt.registerLazySingleton(
      () => ProductRemoteDataSource(productService: getIt()));
  getIt.registerLazySingleton(() => CategoryRemoteDataSource(getIt()));

  getIt.registerLazySingleton(() => CartRepository(getIt()));
  getIt.registerLazySingleton(() => CategoryRepository(getIt(), getIt()));

  getIt.registerFactory(() => CategoriesCubit(getIt()));
  getIt.registerFactory(() => CartCubit(cartRepository: getIt()));
}
