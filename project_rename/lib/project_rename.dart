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

  Directory projectDirectory = Directory("../$oldProjectName");

  try {
    //Se sobreescribe el nombre del proyecto en pubspec.yaml
    pubspec.writeAsStringSync(pubspecContent);
    //Se cambia el nombre del directorio
    projectDirectory.renameSync("../${configJson["projectName"]}");
    print("Renombrado exitoso");
  } catch (e) {
    pubspecContent = pubspec.readAsStringSync();
    pubspecContent =
        pubspecContent.replaceAll(configJson['proyectName'], oldProjectName);
    pubspec.writeAsStringSync(pubspecContent);
    print(
        "No se pudo modificar el nombre de proyecto porque la carpeta está en uso");
  }
}
