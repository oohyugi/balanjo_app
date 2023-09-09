import 'package:balanjo_app/src/shared/data/local/dao/category_dao.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../src/shared/data/local/dao/cart_dao.dart';
import '../src/shared/data/local/dao/product_dao.dart';

List<CollectionSchema> collectionSchemas() {
  return [
    CartDaoSchema,
    CategoryDaoSchema,
    ProductDaoSchema
  ];
}

class IsarHelper {
  late Future<Isar> db;

  IsarHelper() {
    db = openDb();
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationSupportDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(collectionSchemas(),
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }
}
