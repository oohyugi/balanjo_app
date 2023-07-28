import 'package:balanjo_app/main.dart';

import '../bloc/bloc.dart';


void collectionsModule() {
  getIt.registerFactory(() => CollectionsCubit());
}
