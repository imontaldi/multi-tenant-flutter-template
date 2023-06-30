# Pasos para configurar el proyecto

- Clonar el proyecto 
- Abrir el archivo config.json y cambiar lo que se quiera cambiar
- Cerrar vscode y github desktop 
- Abrir vscode en la carpeta project_rename
- Correr dart pub get 
- Correr dart run project_rename si se cambió el nombre del proyecto en config.json
- Abrir el proyecto en vscode, desde raiz
- seleccionar version de flutter a usar
- Correr flutter pub get
- Ejecutar flutter create . --platforms=android,ios
- Correr dart run package_rename si se cambió packageName/appName/bundleName en config.json
- Correr dart run flutter_launcher_icons si se cambió algo de íconos en config.json
- En vscode agregar archivo launch.json y agregar línea 
- "toolArgs": ["--dart-define-from-file=config.json"]
- Ejecutar la app y listo