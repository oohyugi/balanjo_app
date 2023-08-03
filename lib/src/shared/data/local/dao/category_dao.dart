import 'package:balanjo_app/src/shared/data/network/response/category_response.dart';
import 'package:isar/isar.dart';

part 'category_dao.g.dart';

@collection
class CategoryDao {
  Id? id = Isar.autoIncrement;
  String? name;
  String? imageUrl;

  CategoryDao({this.id, this.name, this.imageUrl});

  CategoryDao.fromApi(CategoryResponse categoryResponse) {
    id = categoryResponse.id;
    name = categoryResponse.name;
    imageUrl = categoryResponse.imageUrl;
  }
}
