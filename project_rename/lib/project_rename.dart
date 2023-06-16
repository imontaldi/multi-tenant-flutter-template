import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

void projectRename() {
  final rootProjectDir = Directory("..\\.");

  final List<FileSystemEntity> rootProjectDirEntities =
      rootProjectDir.listSync().toList();

  late Directory targetDirectory;

  for (var element in rootProjectDirEntities) {
    if (element is Directory &&
        !path.basename(element.path).contains(".") &&
        !FileSystemEntity.identicalSync(element.path, Directory.current.path)) {
      targetDirectory = Directory(element.path);
    }
  }

  final configFileContent =
      File("${targetDirectory.path}/config.json").readAsStringSync();
  final configJson = jsonDecode(configFileContent) as Map<String, dynamic>;

  File pubspec = File("${targetDirectory.path}/pubspec.yaml");

  String originalPubspecContent = pubspec.readAsStringSync();

  String oldProjectName = originalPubspecContent.substring(
      originalPubspecContent.indexOf(":") + 2,
      originalPubspecContent.indexOf("\n"));

  // print(targetDirectory.path);
  // print(configJson['proyectName'].toString());

  try {
    //Se sobreescribe el nombre del proyecto en pubspec.yaml
    pubspec.writeAsStringSync(originalPubspecContent.replaceAll(
        oldProjectName, configJson['proyectName']));
    // Se cambia el nombre del directorio
    targetDirectory.renameSync("${configJson["projectName"]}");
    print("Renombrado exitoso");
  } catch (e) {
    pubspec.writeAsStringSync(originalPubspecContent);
    print(e);
  }
}
