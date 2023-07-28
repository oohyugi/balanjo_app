import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../src/shared/data/local/dao/cart_dao.dart';

List<CollectionSchema> collectionSchemas() {
  return [
    CartDaoSchema,
  ];
}

class IsarDb {
  late Future<Isar> db;

  IsarDb() {
    db = openDb();
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(collectionSchemas(),
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }
}
