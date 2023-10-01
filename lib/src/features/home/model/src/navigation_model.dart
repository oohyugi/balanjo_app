import 'package:balanjo_app/theme/icons.dart';

class NavigationModel {
  final int index;
  final String name;
  final String assetIcon;
  final String assetIconSelected;

  NavigationModel(
      {required this.index,
      required this.name,
      required this.assetIcon,
      required this.assetIconSelected});

  static List<NavigationModel> navigations() {
    List<NavigationModel> list = List.empty(growable: true);
    list.add(NavigationModel(
        index: 0,
        name: "Beranda",
        assetIcon: Assets.icHome,
        assetIconSelected: Assets.icHomeBold));
    // list.add(NavigationModel(
    //     index: 1,
    //     name: "Favorite",
    //     assetIcon: assetNameBagHeart,
    //     assetIconSelected: assetNameBagHeartBold));

    list.add(NavigationModel(
        index: 1,
        name: "Pesanan",
        assetIcon: Assets.icBill,
        assetIconSelected: Assets.icBillBold));

    list.add(NavigationModel(
        index: 2,
        name: "Akun",
        assetIcon: Assets.icUser,
        assetIconSelected: Assets.icUserBold));

    return list;
  }
}
