import 'dart:convert';

import 'package:flutter/material.dart';

String kApiStrings(String key) {
  return jsonDecode(_convertToJsonStringQuotes(
      raw: const String.fromEnvironment('api')))[key];
}

Color kColors(String key) {
  return Color(int.parse(jsonDecode(_convertToJsonStringQuotes(
      raw: const String.fromEnvironment('colors')))[key]));
}

String kIconsPaths(String key) {
  return jsonDecode(_convertToJsonStringQuotes(
      raw: const String.fromEnvironment('icons')))[key];
}

String _convertToJsonStringQuotes({required String raw}) {
  String jsonString = raw;

  /// add quotes to json string
  jsonString = jsonString.replaceAll('{', '{"');
  jsonString = jsonString.replaceAll(': ', '": "');
  jsonString = jsonString.replaceAll(', ', '", "');
  jsonString = jsonString.replaceAll('}', '"}');

  /// remove quotes on object json string
  jsonString = jsonString.replaceAll('"{"', '{"');
  jsonString = jsonString.replaceAll('"}"', '"}');

  /// remove quotes on array json string
  jsonString = jsonString.replaceAll('"[{', '[{');
  jsonString = jsonString.replaceAll('}]"', '}]');

  return jsonString;
}
