// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import '../src/utils/functions_utils.dart';

class KStrings {
  static String KEnrollmentName = _kApiStrings(key: "KEnrollmentName");
}

String _kApiStrings({required String key}) {
  return jsonDecode(convertToJsonStringQuotes(
      raw: const String.fromEnvironment('strings')))[key];
}
