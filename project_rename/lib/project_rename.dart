import 'dart:convert';
import 'dart:io';

void projectRename() {
  final configFileContent =
      File("../flutter_template/config.json").readAsStringSync();
  final configJson = jsonDecode(configFileContent) as Map<String, dynamic>;

  File pubspec = File("../flutter_template/pubspec.yaml");

  String pubspecContent = pubspec.readAsStringSync();

  String oldProjectName = pubspecContent.substring(
      pubspecContent.indexOf(":") + 2, pubspecContent.indexOf("\n"));

  pubspecContent =
      pubspecContent.replaceAll(oldProjectName, configJson['proyectName']);

  pubspec.writeAsStringSync(pubspecContent);

  Directory projectDirectory = Directory("../$oldProjectName");

  projectDirectory.renameSync("../${configJson["projectName"]}");
}
