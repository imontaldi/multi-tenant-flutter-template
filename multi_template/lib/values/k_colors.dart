// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../src/utils/functions_utils.dart';

class KColors {
  Color KPrimary = _kColors(key: "KPrimary");
  Color KPrimary_T1 = _kColors(key: "KPrimary_T1");
  Color KPrimary_D1 = _kColors(key: "KPrimary_D1");
  Color KPrimary_L1 = _kColors(key: "KPrimary_L1");
  Color KPrimary_L2 = _kColors(key: "KPrimary_L2");
  Color KPrimary_L3 = _kColors(key: "KPrimary_L3");
  Color KPrimary_L4 = _kColors(key: "KPrimary_L4");
  Color KPrimary_L5 = _kColors(key: "KPrimary_L5");

  Color KRed = _kColors(key: "KRed");
  Color KRedL1 = _kColors(key: "KRedL1");

  Color KSecondary = _kColors(key: "KSecondary");
  Color KGray_T3 = _kColors(key: "KGray_T3");
  Color KGray_T2 = _kColors(key: "KGray_T2");
  Color KGray_T1 = _kColors(key: "KGray_T1");

  Color KGray = _kColors(key: "KGray");
  Color KGray_L1 = _kColors(key: "KGray_L1");
  Color KGray_L2 = _kColors(key: "KGray_L2");
  Color KGray_L3 = _kColors(key: "KGray_L3");
  Color KGray_L4 = _kColors(key: "KGray_L4");
  Color KGray_L5 = _kColors(key: "KGray_L5");
  Color KGray_L6 = _kColors(key: "KGray_L6");
  Color KGray_L7 = _kColors(key: "KGray_L7");
  Color KGray_L8 = _kColors(key: "KGray_L8");
  Color KGreen = _kColors(key: "KGreen");

  Color KBlue = _kColors(key: "KBlue");

  Color KYellow = _kColors(key: "KYellow");

  Color KWhite = _kColors(key: "KWhite");

  Color KOrange = _kColors(key: "KOrange");
  Color KOrange_L1 = _kColors(key: "KOrange_L1");
  Color KBlack_L2 = _kColors(key: "KBlack_L2");
  Color KBlack_L1 = _kColors(key: "KBlack_L1");

  Color KBlack_T1 = _kColors(key: "KBlack_T1");
  Color KBlack = _kColors(key: "KBlack");
}

Color _kColors({required String key}) {
  return Color(int.parse(
      "0xFF${jsonDecode(convertToJsonStringQuotes(raw: const String.fromEnvironment('colors')))[key].substring(1)}"));
}
