import 'package:balanjo_app/config/isar_helper.dart';
import 'package:balanjo_app/src/shared/data/local/dao/location_dao.dart';
import 'package:isar/isar.dart';
import '../../../../utils/log.dart';
import '../dao/cart_dao.dart';

class LocationLocalDataSource {
  final IsarHelper _isarDb;

  LocationLocalDataSource(this._isarDb);

  Future<void> save(LocationDao location) async {
    final isar = await _isarDb.db;
    isar.writeTxnSync<int>(() => isar.locationDaos.putSync(location));
  }

  Future<List<LocationDao>> getAll() async {
    final isar = await _isarDb.db;
    var results = isar.writeTxnSync(() => isar.locationDaos.where().findAllSync());

    return results;
  }
}
