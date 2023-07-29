import 'package:balanjo_app/src/features/order_confirmation/bloc/src/item_order_cubit.dart';
import 'package:balanjo_app/src/features/order_confirmation/data/repository/order_repository.dart';

import '../../../../main.dart';
import '../bloc/bloc.dart';

void orderModule() {
  getIt.registerLazySingleton(() => OrderRepository(
      cartLocalService: getIt(), productRemoteDataSource: getIt()));

  getIt.registerFactory(() => SummaryOrderCubit(orderRepository: getIt()));
  getIt.registerFactory(() => ItemOrderCubit(orderRepository: getIt()));
}
