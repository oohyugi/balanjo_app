import 'package:isar/isar.dart';

part 'location_dao.g.dart';

@collection
class LocationDao {
  Id id;

  late double latitude;
  late double longitude;
  late String address;

  LocationDao(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.address});
}
