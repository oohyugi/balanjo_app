import 'package:balanjo_app/src/shared/data/local/datasource/category_local_datasource.dart';
import 'package:balanjo_app/src/shared/data/local/dao/category_dao.dart';
import 'package:balanjo_app/src/shared/data/network/response/category_response.dart';
import 'package:balanjo_app/src/utils/sync_server.dart';

import '../../../model/src/category_model.dart';
import '../../network/cateogory/category_remote_datasource.dart';

abstract class ICategoryRepository {
  Future<List<CategoryModel>> fetchCategories();
}

class CategoryRepository implements ICategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  final CategoryLocalDataSource categoryLocalDataSource;

  CategoryRepository(
      this.categoryRemoteDataSource, this.categoryLocalDataSource);

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final Result<List<CategoryModel>> result = await syncData<
        List<CategoryModel>, List<CategoryResponse>, List<CategoryDao>>(
      request: categoryRemoteDataSource.fetchCategories,
      local:categoryLocalDataSource.getAllCategory,
      saveToLocal: (networkData) async {
        await categoryLocalDataSource.saveAllCategory(networkData);
      },
      mapper: (local) {
        return local.map((e) => CategoryModel.fromLocal(e)).toList();
      },
    );
    return result.data;
  }
}
