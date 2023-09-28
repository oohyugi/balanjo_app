import 'package:balanjo_app/config/isar_helper.dart';
import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/bloc/src/location/location_cubit.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/category_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/cart_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/location_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/cateogory/category_remote_datasource.dart';
import 'package:balanjo_app/src/shared/data/network/cateogory/category_service.dart';
import 'package:balanjo_app/src/shared/data/network/product/product_remote_datasource.dart';
import 'package:balanjo_app/src/shared/data/repository/repository.dart';
import 'package:balanjo_app/src/shared/data/repository/src/category_repository.dart';
import 'package:balanjo_app/src/shared/data/repository/src/location_repository.dart';

import '../data/local/datasource/product_local_datasource.dart';
import '../data/network/product/product_service.dart';

void sharedModule() {
  //local
  getIt.registerFactory(() => IsarHelper());
  getIt.registerFactory(() => CartLocalDataSource(getIt()));
  getIt.registerLazySingleton(() => CategoryLocalDataSource(getIt()));
  getIt.registerLazySingleton(() => ProductLocalDataSource(getIt()));
  getIt.registerLazySingleton(() => LocationLocalDataSource(getIt()));

  //remote
  getIt.registerLazySingleton(() => ProductService());
  getIt.registerLazySingleton(() => CategoryService());

  getIt.registerLazySingleton(
      () => ProductRemoteDataSource(productService: getIt()));
  getIt.registerLazySingleton(() => CategoryRemoteDataSource(getIt()));

  getIt.registerLazySingleton(() => CartRepository(getIt()));
  getIt.registerLazySingleton(() => CategoryRepository(getIt(), getIt()));
  getIt.registerLazySingleton(() => LocationRepository(getIt()));

  getIt.registerFactory(() => CategoriesCubit(getIt()));
  getIt.registerFactory(() => CartCubit(cartRepository: getIt()));
  getIt.registerFactory(() => LocationCubit(getIt()));
  getIt.registerFactory(() => SavedLocationCubit(getIt()));
}
