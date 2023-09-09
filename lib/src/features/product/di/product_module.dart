import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/features/product/bloc/product_cubit.dart';
import 'package:balanjo_app/src/features/product/repository/product_repository.dart';

void productModule() {
  getIt.registerLazySingleton(() => ProductRepository(getIt(), getIt()));
  getIt.registerFactory(() => ProductCubit(getIt()));
}
