import 'dart:convert';
import 'dart:io';

void projectRename() {
  final configFileContent =
      File("../flutter_template/config.json").readAsStringSync();
  final configJson = jsonDecode(configFileContent) as Map<String, dynamic>;

  File pubspec = File("../flutter_template/pubspec.yaml");

  String originalPubspecContent = pubspec.readAsStringSync();

  String oldProjectName = originalPubspecContent.substring(
      originalPubspecContent.indexOf(":") + 2,
      originalPubspecContent.indexOf("\n"));

  Directory projectDirectory = Directory("../$oldProjectName");

  try {
    //Se sobreescribe el nombre del proyecto en pubspec.yaml
    pubspec.writeAsStringSync(originalPubspecContent.replaceAll(
        oldProjectName, configJson['proyectName']));
    //Se cambia el nombre del directorio
    projectDirectory.renameSync("../${configJson["projectName"]}");
    print("Renombrado exitoso");
  } catch (e) {
    pubspec.writeAsStringSync(originalPubspecContent);
    print(e);
  }
}
