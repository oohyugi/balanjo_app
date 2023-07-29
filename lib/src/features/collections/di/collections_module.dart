import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/features/collections/repository/collection_repository.dart';

import '../bloc/bloc.dart';

void collectionsModule() {

  getIt.registerLazySingleton(
      () => CollectionRepository(productRemoteDataSource: getIt()));

  getIt.registerFactory(() => CollectionsCubit(collectionRepository: getIt()));
}
