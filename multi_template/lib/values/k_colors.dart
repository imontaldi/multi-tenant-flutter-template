// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';

import '../src/utils/functions_utils.dart';

class KColors {
  Color KPrimary = KColors().parseColorValue(key: "KPrimary");
  Color KPrimary_T1 = KColors().parseColorValue(key: "KPrimary_T1");
  Color KPrimary_D1 = KColors().parseColorValue(key: "KPrimary_D1");
  Color KPrimary_L1 = KColors().parseColorValue(key: "KPrimary_L1");
  Color KPrimary_L2 = KColors().parseColorValue(key: "KPrimary_L2");
  Color KPrimary_L3 = KColors().parseColorValue(key: "KPrimary_L3");
  Color KPrimary_L4 = KColors().parseColorValue(key: "KPrimary_L4");
  Color KPrimary_L5 = KColors().parseColorValue(key: "KPrimary_L5");

  Color KRed = KColors().parseColorValue(key: "KRed");
  Color KRedL1 = KColors().parseColorValue(key: "KRedL1");

  Color KSecondary = KColors().parseColorValue(key: "KSecondary");
  Color KGray_T3 = KColors().parseColorValue(key: "KGray_T3");
  Color KGray_T2 = KColors().parseColorValue(key: "KGray_T2");
  Color KGray_T1 = KColors().parseColorValue(key: "KGray_T1");

  Color KGray = KColors().parseColorValue(key: "KGray");
  Color KGray_L1 = KColors().parseColorValue(key: "KGray_L1");
  Color KGray_L2 = KColors().parseColorValue(key: "KGray_L2");
  Color KGray_L3 = KColors().parseColorValue(key: "KGray_L3");
  Color KGray_L4 = KColors().parseColorValue(key: "KGray_L4");
  Color KGray_L5 = KColors().parseColorValue(key: "KGray_L5");
  Color KGray_L6 = KColors().parseColorValue(key: "KGray_L6");
  Color KGray_L7 = KColors().parseColorValue(key: "KGray_L7");
  Color KGray_L8 = KColors().parseColorValue(key: "KGray_L8");
  Color KGreen = KColors().parseColorValue(key: "KGreen");

  Color KBlue = KColors().parseColorValue(key: "KBlue");

  Color KYellow = KColors().parseColorValue(key: "KYellow");

  Color KWhite = KColors().parseColorValue(key: "KWhite");

  Color KOrange = KColors().parseColorValue(key: "KOrange");
  Color KOrange_L1 = KColors().parseColorValue(key: "KOrange_L1");
  Color KBlack_L2 = KColors().parseColorValue(key: "KBlack_L2");
  Color KBlack_L1 = KColors().parseColorValue(key: "KBlack_L1");

  Color KBlack_T1 = KColors().parseColorValue(key: "KBlack_T1");

  Color parseColorValue({required String key}) {
    return Color(int.parse(
        "0xFF${jsonDecode(convertToJsonStringQuotes(raw: const String.fromEnvironment('colors')))[key].substring(1)}"));
  }
}
