import 'package:balanjo_app/src/utils/log.dart';

extension DateExt on String {
  int toSecond() {
    return DateTime.parse(this).second;
  }

  int toMilliseconds() {
    return DateTime.parse(this).millisecondsSinceEpoch;
  }

  int toDurationInSecond(String endDate) {
    final startDate = DateTime.parse(this);
    final untilDate = DateTime.parse(endDate);
    return untilDate.difference(DateTime.now()).inSeconds;
  }
}
