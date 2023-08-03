import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import '../../../model/model.dart';

class ProductResponse {
  int? id = -1;
  String? name;
  String? sku;
  String? imageUrl;
  String? desc;
  int? categoryId;
  int? stock;
  List<int>? tagIds;
  PriceResponse? price;
  SectionResponse? section;

  ProductResponse(
      {required this.id,
      this.name,
      this.sku,
      this.imageUrl,
      this.desc,
      this.categoryId,
      this.stock,
      this.tagIds,
      this.price,
      this.section});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    imageUrl = json['image_url'];
    desc = json['desc'];
    categoryId = json['category_id'];
    stock = json['stock'];
    tagIds = json['tag_ids'].cast<int>();
    price =
        json['price'] != null ? PriceResponse.fromJson(json['price']) : null;
    section = json['section'] != null
        ? SectionResponse.fromJson(json['section'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sku'] = sku;
    data['image_url'] = imageUrl;
    data['desc'] = desc;
    data['category_id'] = categoryId;
    data['stock'] = stock;
    data['tag_ids'] = tagIds;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (section != null) {
      data['section'] = section!.toJson();
    }
    return data;
  }


}

class PriceResponse {
  int? basePrice;
  int? discount;
  int? offerPrice;

  PriceResponse({this.basePrice, this.discount, this.offerPrice});

  PriceResponse.fromJson(Map<String, dynamic> json) {
    basePrice = json['base_price'];
    discount = json['discount'];
    offerPrice = json['offer_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_price'] = basePrice;
    data['discount'] = discount;
    data['offer_price'] = offerPrice;
    return data;
  }
}

class SectionResponse {
  int? id;
  String? name;
  String? startDate;
  String? endDate;

  SectionResponse({this.id, this.name, this.startDate, this.endDate});

  SectionResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}
