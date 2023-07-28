import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/features/home/data/repository/repository.dart';

import '../bloc/bloc.dart';

void homeModule() {
  getIt.registerLazySingleton(() => ProductRepository());

  getIt.registerFactory(() => HomeCubit());
  getIt.registerFactory(() => FlashSaleCubit(productRepository: getIt()));
  getIt.registerFactory(() =>
      ForyouProductCubit(cartRepository: getIt(), productRepository: getIt()));
}
