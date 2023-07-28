import 'package:intl/intl.dart';

extension DoubleExt on double {
  String toIdr() {
    return NumberFormat.simpleCurrency(name: 'IDR', decimalDigits: 0)
        .format(this);
  }
}

extension TimeFormatExt on int {
  String toTime() {
    return NumberFormat("00").format(this);
  }
}
