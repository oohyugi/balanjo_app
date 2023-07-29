import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';

import '../../../model/model.dart';

class ProductResponse {
  int? id;
  String? name;
  String? sku;
  String? imageUrl;
  String? desc;
  int? categoryId;
  int? stock;
  List<int>? tagIds;
  Price? price;
  Section? section;

  ProductResponse(
      {id,
      name,
      sku,
      imageUrl,
      desc,
      categoryId,
      stock,
      tagIds,
      price,
      section});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    imageUrl = json['image_url'];
    desc = json['desc'];
    categoryId = json['category_id'];
    stock = json['stock'];
    tagIds = json['tag_ids'].cast<int>();
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    section =
        json['section'] != null ? Section.fromJson(json['section']) : null;
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

  ProductModel toProductModel({int qty = 0}) {
    return ProductModel(
        basePrice: price?.basePrice?.toDouble() ?? 0,
        discountPercent: price?.discount ?? 0,
        displayPrice: _getDisplayPrice(price),
        imageUrl: imageUrl.orEmpty,
        id: id ?? -1,
        maxQty: stock ?? 0,
        qty: qty,
        title: name.orEmpty);
  }

  double _getDisplayPrice(Price? price) {
    if (price != null) {
      if (price.offerPrice != 0) {
        return price.offerPrice!.toDouble();
      } else {
        return price.basePrice!.toDouble();
      }
    } else {
      return 0;
    }
  }
}

class Price {
  int? basePrice;
  int? discount;
  int? offerPrice;

  Price({basePrice, discount, offerPrice});

  Price.fromJson(Map<String, dynamic> json) {
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

class Section {
  int? id;
  String? name;
  String? startDate;
  String? endDate;

  Section({this.id, this.name, this.startDate, this.endDate});

  Section.fromJson(Map<String, dynamic> json) {
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
