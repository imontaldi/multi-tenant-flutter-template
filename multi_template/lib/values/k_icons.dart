// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import '../src/utils/functions_utils.dart';

class KIcons {
  String KIconExamplePath = _kIconsPaths(key: "KIconExamplePath");
}

String _kIconsPaths({required String key}) {
  return jsonDecode(convertToJsonStringQuotes(
      raw: const String.fromEnvironment('icons')))[key];
}
