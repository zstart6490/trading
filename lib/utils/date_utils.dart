import 'package:intl/intl.dart';

class CountdownTime {
  int inDay;
  int inHour;
  int inMinute;
  int inSecond;
  CountdownTime({
    this.inDay = 0,
    this.inHour = 0,
    this.inMinute = 0,
    this.inSecond = 0,
  });
}

extension DateExtension on DateTime {
  String toStringFormat(String format) {
    return DateFormat(format, "vi").format(toLocal());
  }

  DateTime dateWithoutTime() {
    return DateTime.utc(
      year,
      month,
      day,
    );
  }

  DateTime dateWithoutDay() {
    return DateTime.utc(
      year,
      month,
    );
  }

  /// 13:00 ngày 21
  String toEdString() {
    return "${DateFormat("HH:mm").format(this)} ngày ${DateFormat("dd").format(this)}";
  }

  CountdownTime countdownFrom(DateTime from) {
    final diff = difference(from);
    var second = diff.inSeconds;
    final CountdownTime result = CountdownTime();

    ///Calculate the number of days remaining.
    if (second >= 86400) {
      result.inDay = second ~/ 86400;
      second %= 86400;
    }

    ///Calculate remaining hours.
    if (second >= 3600) {
      result.inHour = second ~/ 3600;
      second %= 3600;
    }

    ///Calculate remaining minutes.
    if (second >= 60) {
      result.inMinute = second ~/ 60;
      second %= 60;
    }

    ///Calculate remaining seconds.
    result.inSecond = second;
    return result;
  }
}

extension StringToDateExtension on String {
  DateTime toDateFormat(String format) {
    try {
      if (format == DateFormater.UTC) {
        return DateFormat(DateFormater.UTC).parseUtc(this).toLocal();
      }
      final df = DateFormat(format);

      return df.parse(this);
    } on Exception {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }
}

class DateFormater {
  static const UTC = "yyyy-MM-ddTHH:mm:ssZ";
  static const MMYYYY = "MM/yyyy";
  static const HHmmDDMMYYYY = "HH:mm - dd/MM/yyyy";
  static const ddMMYYYY = "dd/MM/yyyy";
  static const yyyyMMdd = "yyyy/MM/dd";
  static const YYYYMMDD = "yyyy-MM-dd";
  static const HH_mm_DD_MM_YYYY = "HH_mm_dd_MM_yyyy";
  static const ddMMyyyyHHmm = "dd/MM/yyyy HH:mm";
  static const HHmm = "HH:mm";
  static const HHmmdd = "HH:mm /dd";
  static const hhmma = "hh:mm a";
  static const ddhhmma = "dd hh:mm a";
  static const hhmmass = "hh:mm:ss a";
  static const HHmmss = "HH:mm:ss";
  static const MMddyyyyHHmm = "MM-dd-yyyy HH:mm";
  static const MMMddyyyyHHmm = "MMM-dd-yyyy HH:mm";
  static const MMMddyyyyhhmma = "MMM dd yyyy hh:mm a";
  static const MMMddyyyyhhmmssa = "MMM dd, yyyy hh:mm:ss a";
  static const MMMddyyyy = "MMM dd, yyyy";
  static const MMMyyyy = "MMM yyyy";
  static const MMyyyy = "MM/yyyy";
  static const yyyyMMddTHHmma = "yyyy-MM-dd hh:mm a";
  static const ddMMyyyyTHHmmssa = "dd-MM-yyyy hh:mm:ss a";
  static const MMM_dd = "MMM-dd";
  static const dd = "dd";
  static const E = "E";
  static const EEEE = "EEEE";
  static const MMM = "MMM";
  static const EEEEMMMddyyyy = "EEEE, MMM dd, yyyy";
  static const EEEEMMMMddyyyy = "EEEE, MMMM dd, yyyy";
  static const yyyyMMddhhmm = "yyyy-HH-dd hh:mm";
  static const ddMMMyyyyhhmma = "dd MMM yyyy hh:mm a";
  static const ddMMMyyyy = "dd MMMM, yyyy";
  static const ddMMMMyyyy = "dd MMMM yyyy";
  static const ddMMMyyyyhhmmssa = "dd MMM yyyy hh:mm:ss a";
  static const ddMMyyyyhhmma = "dd/MM/yy : hh:mm a";
  static const MMMMdd = "MMMM dd";
  static const MMMMddyyyy = "MMMM dd, yyyy";
  static const LLL = "LLL";
  //08:36AM - 31/11/2019
  static const hhmmaddMMYYYY = "hh:mm a - dd/MM/YYYY";
  static const ddMMYYYYhhmm = "dd/MM/yyyy - HH:mm";

  static const DotDDMMYYYY = "dd.MM.yyyy";
  static const hhmmDDMMYYYY = "HH:mm, dd/MM/yyyy";
}
