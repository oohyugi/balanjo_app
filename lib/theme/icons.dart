import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String assetNameBagHeart = 'assets/icons/ic_bag_heart.svg';
const String assetNameBagHeartBold = 'assets/icons/ic_bag_heart_bold.svg';

const String assetNameHome = 'assets/icons/ic_home.svg';
const String assetNameHomeBold = 'assets/icons/ic_home_bold.svg';

const String assetNameBill = 'assets/icons/ic_bill.svg';
const String assetNameBillBold = 'assets/icons/ic_bill_bold.svg';

const String assetNameSetting = 'assets/icons/ic_setting.svg';
const String assetNameSettingBold = 'assets/icons/ic_setting_bold.svg';

const String assetNameSearch = 'assets/icons/ic_search.svg';
const String assetNameNotif = 'assets/icons/ic_notif.svg';
const String assetNameCart = 'assets/icons/ic_cart.svg';
const String icHeart = 'assets/icons/ic_heart.svg';
const String icHeartBold = 'assets/icons/ic_heart_bold.svg';

const String assetNameEdit = 'assets/icons/ic_edit.svg';
const String assetNameBox = 'assets/icons/ic_box.svg';
const String assetNameChecked = 'assets/icons/ic_checked.svg';
const String assetNameCancel = 'assets/icons/ic_cancel.svg';
const String assetNameClock = 'assets/icons/ic_clock.svg';
const String assetNameLogout = 'assets/icons/ic_logout.svg';
const String assetNamePinPoint = 'assets/icons/ic_pinpoint.svg';
const String assetNamePrivacy = 'assets/icons/ic_privacy.svg';
const String assetNameRibbon = 'assets/icons/ic_ribbon.svg';
const String assetNameTerm = 'assets/icons/ic_term.svg';
const String assetNameDelivery = 'assets/icons/ic_delivery.svg';
const String assetNameQuestion = 'assets/icons/ic_question.svg';
const String assetNamePointMap = 'assets/icons/ic_point_map.svg';
const String assetNameUser = 'assets/icons/ic_user.svg';
const String assetNameUserBold = 'assets/icons/ic_user_bold.svg';

final Widget iconBagHeart =
    SvgPicture.asset(assetNameBagHeart, semanticsLabel: 'bag heart');
final Widget iconBagHeartBold =
    SvgPicture.asset(assetNameBagHeartBold, semanticsLabel: 'bag heart bold');

final Widget iconHomeBold = SvgPicture.asset(assetNameHomeBold);

final Widget iconBill = SvgPicture.asset(assetNameBill);
final Widget iconBillBold = SvgPicture.asset(assetNameBillBold);

final Widget iconSetting = SvgPicture.asset(assetNameSetting);
final Widget iconSettingBold = SvgPicture.asset(assetNameSettingBold);

final Widget iconSearch = SvgPicture.asset(assetNameSearch);
final Widget iconNotif = SvgPicture.asset(assetNameNotif);
final Widget iconCart = SvgPicture.asset(assetNameCart);

svgIcon(BuildContext context, String assetName,
        {double? width, double? height, Color? color}) =>
    SvgPicture.asset(assetName,
        height: height,
        width: width,
        colorFilter: ColorFilter.mode(
            color??Theme.of(context).colorScheme.onBackground, BlendMode.srcIn));
