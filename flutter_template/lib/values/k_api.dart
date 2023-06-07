// ignore_for_file: non_constant_identifier_names

import 'package:flutter_template/src/managers/config_manager.dart';

class KApi {
  String KApiUrl = ConfigManager().kJson["api"]["KApiUrl"];
  String KApiLogin = ConfigManager().kJson["api"]["KApiLogin"];
}
