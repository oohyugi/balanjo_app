import 'package:balanjo_app/src/shared/data/network/response/product_response.dart';
import 'package:isar/isar.dart';

part 'product_dao.g.dart';

@collection
class ProductDao {
  Id? id = Isar.autoIncrement;
  String? name;
  String? sku;
  String? imageUrl;
  String? desc;
  int? categoryId;
  int? stock;
  List<int>? tagIds;
  Price? price;
  Section? section;

  ProductDao(
      {this.id,
      this.name,
      this.sku,
      this.imageUrl,
      this.desc,
      this.categoryId,
      this.stock,
      this.tagIds,
      this.price,
      this.section});

  ProductDao.fromApi(ProductResponse response) {
    id = response.id;
    name = response.name;
    sku = response.sku;
    imageUrl = response.imageUrl;
    desc = response.desc;
    categoryId = response.categoryId;
    stock = response.stock;
    tagIds = response.tagIds;
    price = Price.fromApi(response.price);
    section = Section.fromApi(response.section);
  }
}

@embedded
class Price {
  int? basePrice;
  int? discount;
  int? offerPrice;

  Price({this.basePrice, this.discount, this.offerPrice});

  static Price? fromApi(PriceResponse? price) {
    return Price(
      basePrice: price?.basePrice ?? 0,
      discount: price?.discount ?? 0,
      offerPrice: price?.offerPrice ?? 0,
    );
  }
}

@embedded
class Section {
  int? id;
  String? name;
  String? startDate;
  String? endDate;

  Section({this.id, this.name, this.startDate, this.endDate});

  static Section? fromApi(SectionResponse? section) {
    return Section(
      id: section?.id,
      name: section?.name,
      startDate: section?.startDate,
      endDate: section?.endDate,
    );
  }
}
