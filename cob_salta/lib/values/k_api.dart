// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import '../src/utils/functions_utils.dart';

class KApi {
  static String KApiUrl = _kApiStrings(key: "KApiUrl");
  static String KApiLogin = "login";
}

String _kApiStrings({required String key}) {
  return jsonDecode(
      convertToJsonStringQuotes(raw: const String.fromEnvironment('api')))[key];
}
