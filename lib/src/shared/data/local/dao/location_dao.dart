import 'package:isar/isar.dart';

part 'location_dao.g.dart';

@collection
class LocationDao {
  Id id;

  late double latitude;
  late double longitude;
  late String address;
  late String title;

  LocationDao(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.title,
      required this.address});
}
