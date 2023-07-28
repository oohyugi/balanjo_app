import '../../../../shared/model/model.dart';

class FlashSaleModel {
  final String id;
  final String startDate;
  final String endDate;
  final bool isShow;

  final List<ProductModel> products;

  FlashSaleModel(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.isShow,
      required this.products});
}
