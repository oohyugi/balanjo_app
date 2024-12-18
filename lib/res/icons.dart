import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Assets {
  Assets._();

  static const String icBagHeart = 'assets/icons/ic_bag_heart.svg';
  static const String icBagHeartBold = 'assets/icons/ic_bag_heart_bold.svg';
  static const String icHome = 'assets/icons/ic_home.svg';
  static const String icHomeBold = 'assets/icons/ic_home_bold.svg';
  static const String icBill = 'assets/icons/ic_bill.svg';
  static const String icBillBold = 'assets/icons/ic_bill_bold.svg';
  static const String icSetting = 'assets/icons/ic_setting.svg';
  static const String icSettingBold = 'assets/icons/ic_setting_bold.svg';
  static const String icSearch = 'assets/icons/ic_search.svg';
  static const String icNotif = 'assets/icons/ic_notif.svg';
  static const String icCart = 'assets/icons/ic_cart.svg';
  static const String icHeart = 'assets/icons/ic_heart.svg';
  static const String icHeartBold = 'assets/icons/ic_heart_bold.svg';
  static const String icEdit = 'assets/icons/ic_edit.svg';
  static const String icBox = 'assets/icons/ic_box.svg';
  static const String icChecked = 'assets/icons/ic_checked.svg';
  static const String icCancel = 'assets/icons/ic_cancel.svg';
  static const String icClock = 'assets/icons/ic_clock.svg';
  static const String icLogout = 'assets/icons/ic_logout.svg';
  static const String icPinPoint = 'assets/icons/ic_pinpoint.svg';
  static const String icPrivacy = 'assets/icons/ic_privacy.svg';
  static const String icRibbon = 'assets/icons/ic_ribbon.svg';
  static const String icTerm = 'assets/icons/ic_term.svg';
  static const String icDelivery = 'assets/icons/ic_delivery.svg';
  static const String icQuestion = 'assets/icons/ic_question.svg';
  static const String icPointMap = 'assets/icons/ic_point_map.svg';
  static const String icUser = 'assets/icons/ic_user.svg';
  static const String icUserBold = 'assets/icons/ic_user_bold.svg';
  static const String icGps = 'assets/icons/ic_gps.svg';
  static const String icHistory = 'assets/icons/ic_history.svg';
  static const String icMarker = 'assets/icons/ic_marker.svg';
  static const String icGoogle = 'assets/icons/ic_google.svg';
  static const String icLoginGoogle = 'assets/icons/ic_login_google.svg';
}

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.assetName,
      {super.key, this.height, this.width, this.color});

  final String assetName;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName,
        height: height,
        width: width,
        colorFilter: ColorFilter.mode(
            color ?? Theme.of(context).colorScheme.onBackground,
            BlendMode.srcIn));
  }
}
