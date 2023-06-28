// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import '../src/utils/functions_utils.dart';

class KApi {
  String KApiUrl = KApi().kApiStrings("KApiUrl");
  String KApiLogin = KApi().kApiStrings("KApiLogin");

  String kApiStrings(String key) {
    return jsonDecode(convertToJsonStringQuotes(
        raw: const String.fromEnvironment('api')))[key];
  }
}
