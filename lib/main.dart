import 'dart:developer';

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/pages/base/base_binding.dart';
import 'package:trading_project/theme/app_theme.dart';
import 'package:trading_project/configs/constants.dart';
import 'configs/service_api_config.dart';

import 'configs/service_api_config.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'shared/logger/logger_utils.dart';



Future<void> mainCommon(EnvironmentConfiguration serverConfig) async {
  Environment().initConfig(serverConfig);
  log(Environment().config.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
}
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
