/// A *blazingly fast* way to configure your project to be production ready.
///
/// You can customize configurations it in the following way:
/// 1. `package_rename_config` key in `pubspec.yaml`:
/// ```yaml
/// package_rename_config:
///   ...
/// ```
///
/// 2. `package_rename_config.yaml` file at the root of the project:
/// ```yaml
/// package_rename_config:
///   ...
/// ```
library package_rename;

import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:universal_io/io.dart';

part 'constants.dart';
part 'exceptions.dart';
part 'messages.dart';

part 'platforms/android.dart';
part 'platforms/ios.dart';

final _logger = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(
    lineLength: 80,
    methodCount: 0,
    noBoxingByDefault: true,
    printEmojis: false,
  ),
);

/// Starts setting build configurations for the flutter application according
/// to given configuration.
///
/// Configuration is a map of build configurations and their values.
///
/// You can specify it in the following way:
/// 1. `package_rename_config` key in `pubspec.yaml`:
/// ```yaml
/// package_rename_config:
///   ...
/// ```
///
/// 2. `package_rename_config.yaml` file at the root of the project:
/// ```yaml
/// package_rename_config:
///   ...
/// ```
Future<void> set(List<String> args) async {
  try {
    _logger.w(_majorTaskDoneLine);

    final configFileContent = await File('config.json').readAsString();
    final configJson = jsonDecode(configFileContent) as Map<String, dynamic>;

    _setAndroidConfigurations(configJson);
    _setIOSConfigurations(configJson);

    _logger.i(_successMessage);
  } on _PackageRenameException catch (e) {
    _logger.wtf(e.message);
    exit(e.code);
  } catch (e) {
    _logger.wtf(e.toString());
    exit(255);
  } finally {
    _logger.close();
  }
}
