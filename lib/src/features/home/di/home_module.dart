import 'package:balanjo_app/main.dart';

import '../bloc/bloc.dart';
import '../repository/repository.dart';

void homeModule() {
  getIt.registerLazySingleton(() => HomeRepository(getIt()));

  getIt.registerFactory(() => HomeCubit());
  getIt.registerFactory(() => FlashSaleCubit(homeRepository: getIt()));
  getIt.registerFactory(() =>
      ForyouProductCubit(cartRepository: getIt(), homeRepository: getIt()));
}
