// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import '../src/utils/functions_utils.dart';

class KIcons {
  static String KIconSplashIcon = _kIconsPaths(key: "KIconSplashIcon");
  static String KIconEnrollmentType = _kIconsPaths(key: "KIconEnrollmentType");
}

String _kIconsPaths({required String key}) {
  return jsonDecode(convertToJsonStringQuotes(
      raw: const String.fromEnvironment('icons')))[key];
}
