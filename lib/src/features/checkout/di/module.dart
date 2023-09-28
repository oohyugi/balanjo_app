import '../../../../main.dart';
import '../bloc/bloc.dart';
import '../data/repository/checkout_repository.dart';

void checkoutModule() {
  getIt.registerLazySingleton(() => CheckoutRepository(
      cartLocalDataSource: getIt(), productRemoteDataSource: getIt()));

  getIt.registerFactory(() => SummaryCubit(checkoutRepository: getIt()));
  getIt.registerFactory(() => ItemCheckoutCubit(checkoutRepository: getIt()));
}
