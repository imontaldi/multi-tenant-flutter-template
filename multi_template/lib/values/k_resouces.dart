// Dart imports:
import 'dart:convert';

// Flutter imports:

import '../src/utils/functions_utils.dart';

String kApiStrings(String key) {
  return jsonDecode(
      convertToJsonStringQuotes(raw: const String.fromEnvironment('api')))[key];
}

String kIconsPaths(String key) {
  return jsonDecode(convertToJsonStringQuotes(
      raw: const String.fromEnvironment('icons')))[key];
}
