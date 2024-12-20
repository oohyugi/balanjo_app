import 'package:isar/isar.dart';

part 'cart_dao.g.dart';

@collection
class CartDao {
  Id id = Isar.autoIncrement;
  late int qty;
  late int productId;
  late double estimatePrice;
  CartDao({required this.qty, required this.productId, required this.estimatePrice});
}
