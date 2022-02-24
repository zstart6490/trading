import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/pages/base/base_binding.dart';
import 'package:trading_project/theme/app_theme.dart';

import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'shared/logger/logger_utils.dart';

void main() {
  runApp(const TradingApp());
}

class TradingApp extends StatelessWidget {

  const TradingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.light,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BaseBinding(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
