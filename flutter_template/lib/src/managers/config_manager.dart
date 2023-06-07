import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_template/values/k_api.dart';
import 'package:flutter_template/values/k_colors.dart';

class ConfigManager {
  static final ConfigManager _instance = ConfigManager._constructor();

  factory ConfigManager() {
    return _instance;
  }

  ConfigManager._constructor();

  dynamic _configJson;
  dynamic get kJson => _configJson;

  late KColors _colors;
  KColors get colors => _colors;

  late KApi _api;
  KApi get api => _api;

  init() async {
    final String response = await rootBundle.loadString('config.json');
    _configJson = await json.decode(response);
    _colors = KColors();
    _api = KApi();
  }
}
