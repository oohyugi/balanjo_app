import 'package:isar/isar.dart';

@collection
class ProductDao {
  Id id = Isar.autoIncrement;
  late String imageUrl;
  late String title;
  late String discountPercent;
  late double basePrice;
  late double discountPrice;
  late int productId;
  late bool isFavorite;
  late int maxQty;
}
