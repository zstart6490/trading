import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trading_module/configs/constants.dart';

extension DurationExtension on Duration {
  String formatHHMMSS() {
    return '$this'.split('.')[0].padLeft(8, '0');
  }

  String formatMMSS() {
    final p = '$this'.split('.')[0].padLeft(8, '0').split(':');
    return "${p[1]}:${p[2]}";
  }
}

extension StringNullSafetyExtension on String? {
  bool get hasText => this != null && this!.isNotEmpty;

  String? capitalize() {
    return this ?? "${this![0].toUpperCase()}${this!.substring(1)}";
  }
}

extension CustomNumberExtension on int {
  int genRandom() {
    final Random random = Random();
    return random.nextInt(this);
  }
}

extension CustomStringExtension on String {
  static const diacritics =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  static const nonDiacritics =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
  static const diacriticsReg =
      'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ|è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ|ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ|ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ|ì|í|ị|ỉ|ĩ|Ì|Í|Ị|Ỉ|Ĩ|đ|Đ|ỳ|ý|ỵ|ỷ|ỹ|Ỳ|Ý|Ỵ|Ỷ|Ỹ';

  bool get containDiacritics => contains(RegExp(diacriticsReg));

  String get withoutDiacriticalMarks => splitMapJoin('',
      onNonMatch: (char) => char.isNotEmpty && diacritics.contains(char)
          ? nonDiacritics[diacritics.indexOf(char)]
          : char);

  String nonAccentVietnamese() {
    var str = this;
    str = str.toLowerCase();
    str = str.replaceAll(RegExp('à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'), "a");
    str = str.replaceAll(RegExp('è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'), "e");
    str = str.replaceAll(RegExp('ì|í|ị|ỉ|ĩ'), "i");
    str = str.replaceAll(RegExp('ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'), "o");
    str = str.replaceAll(RegExp('ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'), "u");
    str = str.replaceAll(RegExp('ỳ|ý|ỵ|ỷ|ỹ'), "y");
    str = str.replaceAll(RegExp('đ'), "d");
    str = str.replaceAll(RegExp(r'\u0300|\u0301|\u0303|\u0309|\u0323'),
        ""); // Huyền sắc hỏi ngã nặng
    str = str.replaceAll(RegExp(r'\u02C6|\u0306|\u031B'), ""); // Â, Ê, Ă, Ơ, Ư
    return str;
  }

  bool isValidPassLength() {
    return RegExp(r'^.{8,999}$').hasMatch(this);
  }

  bool isEmailWith(String regex) {
    return RegExp(regex).hasMatch(this);
  }

  bool isValidCharacter() {
    return RegExp('.*(^(.*([A-Z]).*([a-z]))|(([a-z]).*([A-Z]))).*')
        .hasMatch(this);
  }

  bool isValidAz() {
    return RegExp('.*[^A-Za-z].*').hasMatch(this);
  }

  bool isPhoneNumberWith(String reg) {
    final fullReg = "^(($reg)+[0-9]{7})\$";
    return RegExp(fullReg).hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(r"^(?=.*[A-Za-z])(?=.*\d).{6,20}$").hasMatch(this);
  }

  String convertToPhone() {
    var res = this;
    if (startsWith("84")) {
      res = "0${res.substring(2)}";
    }
    res = res.replaceAll('+84', '0');
    res = res.replaceAll(RegExp("[^\\d]"), "");
    return res;
  }

  int hexToInt() {
    var hexColor = toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  String phoneWithDialCode(String dialCode) {
    var removeSpace = replaceAll(' ', '');
    if (dialCode == "VN") {
      if (removeSpace.startsWith("0")) removeSpace = removeSpace.substring(1);
      var subString = "";
      for (int i = 1; i <= removeSpace.length; i++) {
        if (i % 3 == 0) {
          subString += " ${removeSpace.substring(i - 3, i)}";
        }
      }
      return "(+84) $subString";
    } else {
      return "(+84) $removeSpace";
    }
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension CustomIntExtension on int {
  String toCurrency({String symbol = "đ"}) {
    final oCcy = NumberFormat.decimalPattern("vi");
    return "${oCcy.format(this)}$symbol";
  }

  String toStock({String symbol = "cp"}) {
    final oCcy = NumberFormat.decimalPattern("vi");
    return "${oCcy.format(this)}$symbol";
  }

  String toCurrencyVND({String symbol = "VNĐ"}) {
    final oCcy = NumberFormat.decimalPattern("vi");
    return "${oCcy.format(this)} $symbol";
  }

  DateTime millisecondsToDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}

extension CustomNumExtension on num {
  String toCurrency({String symbol = "đ"}) {
    final oCcy = NumberFormat.decimalPattern("vi");
    return "${oCcy.format(this)}$symbol";
  }

  num floorWithFractionDigits(int fractionDigits) {
    final p = pow(10, fractionDigits);
    return (this * p).floor() / p;
  }

  String toStockQuantity() {
    return round().toString();
  }

  String toStockQuantityFormat(){
    final value = round();
    final oCcy = NumberFormat.decimalPattern("vi");
    final quantity = oCcy.format(value).replaceAll(",", ".");
    return quantity;
  }

  String roundUpPriceMatch(){
    final value = ceil();
    final oCcy = NumberFormat.decimalPattern("vi");
    final price = oCcy.format(value).replaceAll(",", ".");
    return price;
  }
  String roundDownPriceMatch(){
    final value = floor();
    final oCcy = NumberFormat.decimalPattern("vi");
    final price = oCcy.format(value).replaceAll(",", ".");
    return price;
  }



  String formatWithSeparator({String separator = ","}) {
    return toString().replaceAll(RegExp(r'\.'), separator);
  }
}

extension CustomDoubleExtension on double {
  String toCurrency({String symbol = "đ"}) {
    final oCcy = NumberFormat.decimalPattern("vi");
    return "${oCcy.format(this)}$symbol";
  }

  Color getStockColor() {
    if (this == 0) {
      return refColor;
    }
    if (this > 0) {
      return increaseColor;
    }
    return decreaseColor;
  }

  Color getStockColorWithCurrentPrice(double currentPrice) {
    if (this == currentPrice) {
      return refColor;
    }
    if (this > currentPrice) {
      return increaseColor;
    }
    return decreaseColor;
  }

  Color getStockColorWith(double ref, double floor, double ceil) {
    if (this > ref && this < ceil) {
      return increaseColor;
    }

    if (this < ref && this > floor) {
      return decreaseColor;
    }

    if (this == floor) {
      return floorColor;
    }

    if (this == ceil) {
      return ceilColor;
    }

    return refColor;
  }

  String getRatioChange() {
    if (this == 0) {
      return "0,0%";
    }
    if (this > 0) {
      return "+${this}%".replaceAll(".", ",");
    }
    return "${this}%".replaceAll(".", ",");
  }

  String getPriceStock() {
    final value = this / 1000;
    final oCcy = NumberFormat.decimalPattern("vi");
    final summary = oCcy.format(value);
    return summary;
  }

  String getVolumeStock() {
    final value = this / 10;
    final oCcy = NumberFormat.decimalPattern("vi");
    final summary = oCcy.format(value).replaceAll(",", ".");
    return summary;
  }
}

extension BuildContextExtension on BuildContext {
  //Color
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get primaryColor => Theme.of(this).primaryColor;

  // Color get accentColor => Theme.of(this).accentColor;
  Color get backgroundColor => Theme.of(this).backgroundColor;

  Color get errorColor => Theme.of(this).errorColor;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get shadowColor => Theme.of(this).shadowColor;

  Color get indicatorColor => Theme.of(this).indicatorColor;

  Color get secondaryHeaderColor => Theme.of(this).secondaryHeaderColor;

  //TextStyle
  TextStyle get textSize32 => Theme.of(this).textTheme.headline1!;

  TextStyle get textSize28 => Theme.of(this).textTheme.headline2!;

  TextStyle get textSize24 => Theme.of(this).textTheme.headline3!;

  TextStyle get textSize18light => Theme.of(this).textTheme.headline4!;

  TextStyle get textSize18 => Theme.of(this).textTheme.headline5!;

  TextStyle get textSize16 => Theme.of(this).textTheme.headline6!;

  TextStyle get textSize14 => Theme.of(this).textTheme.subtitle1!;

  TextStyle get textSize12 => Theme.of(this).textTheme.subtitle2!;

  TextStyle get textSize11 => Theme.of(this).textTheme.bodyText1!;

  TextStyle get textSize10 => Theme.of(this).textTheme.bodyText2!;

  //MediaQuery
  Size get screenSize => MediaQuery.of(this).size;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}

extension ImageExtension on String {
  Image pngImage({double? mWidth, double? mHeight}) {
    return Image.asset(
      "assets/images/png/$this.png",
      width: mWidth,
      height: mHeight,
      package: 'trading_module',
    );
  }

  CachedNetworkImage loadCacheImg({double? mWidth, double? mHeight}) {
    return CachedNetworkImage(
      imageUrl: "${this}?t=${DateTime.now().millisecond}",
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => "stock_place_holder".pngImage(),
      width: mWidth,
      height: mHeight,
    );
  }
}
