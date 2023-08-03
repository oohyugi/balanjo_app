import 'package:balanjo_app/config/isar_helper.dart';
import 'package:balanjo_app/src/shared/data/local/dao/category_dao.dart';
import 'package:isar/isar.dart';

import '../../network/response/category_response.dart';

class CategoryLocalDataSource {
  final IsarHelper _helper;

  CategoryLocalDataSource(this._helper);

  Future<void> saveCategory(CategoryResponse categoryResponse) async {
    final isar = await _helper.db;
    isar.writeTxnSync<int>(
        () => isar.categoryDaos.putSync(CategoryDao.fromApi(categoryResponse)));
  }

  Future<void> saveAllCategory(List<CategoryResponse> categories) async {
    final isar = await _helper.db;

    final categoryDaos = categories.map((e) => CategoryDao.fromApi(e)).toList();
    isar.writeTxnSync<List<int>>(
        () => isar.categoryDaos.putAllSync(categoryDaos));
  }

  Future<List<CategoryDao>> getAllCategory() async {
    final isar = await _helper.db;
    var result =
        isar.writeTxnSync(() => isar.categoryDaos.where().findAllSync());

    return result;
  }
}
