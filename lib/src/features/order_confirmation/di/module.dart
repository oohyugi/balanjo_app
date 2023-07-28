import '../../../../main.dart';
import '../bloc/bloc.dart';

void orderModule() {
  getIt.registerFactory(() => SummaryOrderCubit());
}
