import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/features/map/bloc/map_cubit.dart';


void mapModule() {

  getIt.registerFactory(() => MapCubit(getIt()));
}
