import 'dart:ui';
import 'package:flutter/material.dart';

class AppConstants {
  static const Size designScreenSize = Size(375, 754);
  static const Duration TIME_OUT = Duration(hours: 0, minutes: 0, seconds: 15);
}


const NOTI_RELOAD_NOTIFICATION = "NOTI_RELOAD_NOTIFICATION";
const NOTI_RELOAD_HOMESAVING = "NOTI_RELOAD_HOMESAVING";
const NOTI_RELOAD_SAVINGDEPOSIT = "NOTI_RELOAD_SAVINGDEPOSIT";

const DUR_500 = Duration(milliseconds: 500);
const DUR_250 = Duration(milliseconds: 250);
const BOR_RAD12 = BorderRadius.all(Radius.circular(12.0));
const BOR_RAD24 = BorderRadius.all(Radius.circular(24.0));
const BOR_RAD32 = BorderRadius.all(Radius.circular(32.0));
const BOR_RAD60 = BorderRadius.all(Radius.circular(60.0));
const BOR_RAD8 = BorderRadius.all(Radius.circular(8.0));
const BOR_RAD = BorderRadius.all(Radius.circular(8.0));
const BOR_COLOR = Color.fromRGBO(0, 0, 0, 0.08);

/// String Const
const APPSFLYER_ID = "1520144590";
const APPSFLYER_KEY = "cfgYFoj97okaEbzqp8q5w5";
const AUTH_TOKEN_KEY = "tikop_auth";
const AUTH_TOKEN_TYPE_KEY = "tikop_auth_type";
const PUSH_TOKEN_KEY = "_pushTk";
const PASS_INTRO_KEY = "_passedIntro";
const TEMP_PHONE_KEY = "_temp_phone";
const AUTH_PHONE_KEY = "PHONE_NUMBER";
const AUTH_COUNTRY_KEY = "_authCountry";
const REMOTE_CONFIG_KEY = "_remoteConfig";
const REFRESH_TK_SUFFIX = "_REFRESH_TK";
const AUTH_PASS_SUFFIX = "_AUTH_PASS_TK";
const BIOMETRIC_SUFFIX = "_BIOMETRIC";
const BIOMETRICS_COUNTER_SUFFIX = "_BIOMETRIC_FAILED";
const DEPOSIT_FIRST_SUFFIX = "_DEPOSIT_FIRST";

/// SIZE
const AVATAR_SIZE = Size(42, 42);

///SizedBox Width
const SIZED_BOX_W02 = SizedBox(width: 2);
const SIZED_BOX_W04 = SizedBox(width: 4);
const SIZED_BOX_W06 = SizedBox(width: 6);
const SIZED_BOX_W08 = SizedBox(width: 8);
const SIZED_BOX_W10 = SizedBox(width: 10);
const SIZED_BOX_W12 = SizedBox(width: 12);
const SIZED_BOX_W16 = SizedBox(width: 16);
const SIZED_BOX_W20 = SizedBox(width: 20);
const SIZED_BOX_W30 = SizedBox(width: 30);
const SIZED_BOX_W40 = SizedBox(width: 40);
const SIZED_BOX_W45 = SizedBox(width: 45);

/// SizedBox Height
const SIZED_BOX_H04 = SizedBox(height: 4);
const SIZED_BOX_H06 = SizedBox(height: 6);
const SIZED_BOX_H08 = SizedBox(height: 8);
const SIZED_BOX_H12 = SizedBox(height: 12);
const SIZED_BOX_H16 = SizedBox(height: 16);
const SIZED_BOX_H20 = SizedBox(height: 20);
const SIZED_BOX_H24 = SizedBox(height: 24);
const SIZED_BOX_H26 = SizedBox(height: 26);
const SIZED_BOX_H30 = SizedBox(height: 30);
const SIZED_BOX_H40 = SizedBox(height: 40);
const SIZED_BOX_H50 = SizedBox(height: 50);
const SIZED_BOX_H60 = SizedBox(height: 60);
const SIZED_BOX_H72 = SizedBox(height: 72);

/// PADDING
const PAD_ZERO = EdgeInsets.zero;
const PAD_ALL12 = EdgeInsets.all(12.0);
const PAD_ALL16 = EdgeInsets.all(16.0);
const PAD_ALL06 = EdgeInsets.all(4.0);
const PAD_BOTTOM_16 = EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0);
const PAD_ONLY_T20 = EdgeInsets.only(top: 20);
const PAD_ONLY_R20 = EdgeInsets.only(right: 20);

///horizontal
const PAD_SYM_H4 = EdgeInsets.symmetric(horizontal: 4);
const PAD_SYM_H6 = EdgeInsets.symmetric(horizontal: 6);
const PAD_SYM_H8 = EdgeInsets.symmetric(horizontal: 8);
const PAD_SYM_H12 = EdgeInsets.symmetric(horizontal: 12);
const PAD_SYM_H16 = EdgeInsets.symmetric(horizontal: 16);
const PAD_SYM_H20 = EdgeInsets.symmetric(horizontal: 20);
const PAD_SYM_H24 = EdgeInsets.symmetric(horizontal: 24);
const PAD_SYM_H28 = EdgeInsets.symmetric(horizontal: 28);
const PAD_SYM_H30 = EdgeInsets.symmetric(horizontal: 30);
const PAD_SYM_H40 = EdgeInsets.symmetric(horizontal: 40);
const PAD_SYM_H60 = EdgeInsets.symmetric(horizontal: 60);

///vertical
const PAD_SYM_V5 = EdgeInsets.symmetric(vertical: 5);
const PAD_SYM_V06 = EdgeInsets.symmetric(vertical: 6);
const PAD_SYM_V10 = EdgeInsets.symmetric(vertical: 10);
const PAD_SYM_V12 = EdgeInsets.symmetric(vertical: 12);
const PAD_SYM_V20 = EdgeInsets.symmetric(vertical: 20);

///
const PAD_SYM_H16_V12 = EdgeInsets.symmetric(horizontal: 16, vertical: 12);

/// Error Code
const CODE_SUCCESS = -1;
const CODE_ERROR_SERVER_INTERNAL = 500;
const CODE_ERROR_APP_INTERNAL = 0;
