// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart' as android_launcher_icons;
import 'package:flutter_launcher_icons/config/config.dart';
import 'package:flutter_launcher_icons/constants.dart' as constants;
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart' as ios_launcher_icons;
import 'package:flutter_launcher_icons/logger.dart';
import 'package:path/path.dart' as path;

const String fileOption = 'file';
const String helpFlag = 'help';
const String verboseFlag = 'verbose';
const String prefixOption = 'prefix';
const String defaultConfigFile = 'flutter_launcher_icons.yaml';
const String flavorConfigFilePattern = r'^flutter_launcher_icons-(.*).yaml$';

List<String> getFlavors() {
  final List<String> flavors = [];
  for (var item in Directory('.').listSync()) {
    if (item is File) {
      final name = path.basename(item.path);
      final match = RegExp(flavorConfigFilePattern).firstMatch(name);
      if (match != null) {
        flavors.add(match.group(1)!);
      }
    }
  }
  return flavors;
}

Future<void> createIconsFromArguments(List<String> arguments) async {
  final ArgParser parser = ArgParser(allowTrailingOptions: true);
  parser
    ..addFlag(helpFlag, abbr: 'h', help: 'Usage help', negatable: false)
    // Make default null to differentiate when it is explicitly set
    ..addOption(
      fileOption,
      abbr: 'f',
      help: 'Path to config file',
      defaultsTo: defaultConfigFile,
    )
    ..addFlag(verboseFlag, abbr: 'v', help: 'Verbose output', defaultsTo: false)
    ..addOption(
      prefixOption,
      abbr: 'p',
      help: 'Generates config in the given path. Only Supports web platform',
      defaultsTo: '.',
    );

  final ArgResults argResults = parser.parse(arguments);
  // creating logger based on -v flag
  final logger = FLILogger(argResults[verboseFlag]);

  logger.verbose('Received args ${argResults.arguments}');

  if (argResults[helpFlag]) {
    stdout.writeln('Generates icons for iOS and Android');
    stdout.writeln(parser.usage);
    exit(0);
  }

  final String prefixPath = argResults[prefixOption];

  //Load config file data
  final configFileContent = await File('config.json').readAsString();
  final configJson = jsonDecode(configFileContent) as Map<String, dynamic>;

  // Create icons

  // Load configs from given file(defaults to ./flutter_launcher_icons.yaml) or from ./pubspec.yaml

  final flutterLauncherIconsConfigs = loadConfigFileFromArgResults(configJson);
  if (flutterLauncherIconsConfigs == null) {
    throw NoConfigFoundException(
      'No configuration found in $defaultConfigFile or in ${constants.pubspecFilePath}. '
      'In case file exists in different directory use --file option',
    );
  }
  try {
    await createIconsFromConfig(
      flutterLauncherIconsConfigs,
      logger,
      prefixPath,
    );
    print('\n✓ Successfully generated launcher icons');
  } catch (e) {
    stderr.writeln('\n✕ Could not generate launcher icons');
    stderr.writeln(e);
    exit(2);
  }
}

Future<void> createIconsFromConfig(
  Config flutterConfigs,
  FLILogger logger,
  String prefixPath, [
  String? flavor,
]) async {
  if (!flutterConfigs.hasPlatformConfig) {
    throw const InvalidConfigException(errorMissingPlatform);
  }

  if (flutterConfigs.isNeedingNewAndroidIcon) {
    android_launcher_icons.deleteOldAdaptiveIcons();
    android_launcher_icons.createDefaultIcons(
      flutterConfigs,
      flavor,
    );
  }
  if (flutterConfigs.hasAndroidAdaptiveConfig) {
    android_launcher_icons.createAdaptiveIcons(
      flutterConfigs,
      flavor,
    );
  }
  if (flutterConfigs.isNeedingNewIOSIcon) {
    ios_launcher_icons.createIcons(
      flutterConfigs,
      flavor,
    );
  }

  // Generates Icons for given platform
  generateIconsFor(
    config: flutterConfigs,
    logger: logger,
    prefixPath: prefixPath,
    flavor: flavor,
    platforms: (context) {
      final platforms = <IconGenerator>[];
      return platforms;
    },
  );
}

Config? loadConfigFileFromArgResults(Map<String, dynamic> configJson) {
  final flutterLauncherIconsConfigs = Config.fromJson(configJson);
  return flutterLauncherIconsConfigs;
}
