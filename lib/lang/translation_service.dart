import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/lang/vi_VN.dart';
import 'en_us.dart';
import 'pt_br.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'pt_BR': pt_BR,
        'vi_VN': vi_VN,
      };
}
