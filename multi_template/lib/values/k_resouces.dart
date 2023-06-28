// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

import '../src/utils/functions_utils.dart';

String kApiStrings(String key) {
  return jsonDecode(
      convertToJsonStringQuotes(raw: const String.fromEnvironment('api')))[key];
}

Color kColors(String key) {
  return Color(int.parse(
      "0xFF${jsonDecode(convertToJsonStringQuotes(raw: const String.fromEnvironment('colors')))[key].substring(1)}"));
}

String kIconsPaths(String key) {
  return jsonDecode(convertToJsonStringQuotes(
      raw: const String.fromEnvironment('icons')))[key];
}
