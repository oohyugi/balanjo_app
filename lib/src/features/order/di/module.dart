import '../../../../main.dart';
import '../bloc/bloc.dart';
import '../data/repository/order_repository.dart';

void orderModule() {
  getIt.registerLazySingleton(() => OrderRepository(
      cartLocalDataSource: getIt(), productRemoteDataSource: getIt()));

  getIt.registerFactory(() => SummaryOrderCubit(orderRepository: getIt()));
  getIt.registerFactory(() => ItemOrderCubit(orderRepository: getIt()));
}
