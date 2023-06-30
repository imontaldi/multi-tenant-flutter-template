// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';

import '../src/utils/functions_utils.dart';

class KColors {
  static Color KPrimary = _kColors(key: "KPrimary");

  static Color KRed = const Color(0xFFF34961);
  static Color KGreen = const Color(0xFF05CE81);
  static Color KYellow = const Color(0xFFFFAA00);
  static Color KBlue = const Color(0xFF5D6CFB);

  static Color KTextGray = const Color(0xFF707070);
  static Color KTextGray_L1 = const Color(0xFF9E9E9E);
  static Color KBackground = const Color(0xFFF3F3F3);

  static Color KBlack = const Color(0xFF000000);
  static Color KGray_T4 = const Color(0xFF333333);
  static Color KGray_T3 = const Color(0x4D666666);
  static Color KGray_T2 = const Color(0xFF656565);
  static Color KGray_T1 = const Color(0xFF707070);
  static Color KGray = const Color(0xFF666666);
  static Color KGray_L1 = const Color(0xFFACACAC);
  static Color KGray_L2 = const Color(0xFFC4C4C4);
  static Color KGray_L3 = const Color(0xFFE4E4E4);
  static Color KGray_L4 = const Color(0xFFF5F5F5);
  static Color KWhite = const Color(0xFFFFFFFF);
  static Color KTransparent = Colors.transparent;
}

Color _kColors({required String key}) {
  return Color(int.parse(
      "0xFF${jsonDecode(convertToJsonStringQuotes(raw: const String.fromEnvironment('colors')))[key].substring(1)}"));
}
