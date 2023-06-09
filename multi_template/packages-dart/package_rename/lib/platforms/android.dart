part of package_rename;

void _setAndroidConfigurations(
  Map<String, dynamic> configJson,
) {
  try {
    _setAndroidAppName(configJson['appName']);
    _setAndroidPackageName(configJson['packageName']);
    _createNewMainActivity(
      packageName: configJson['packageName'],
    );
  } on _PackageRenameException catch (e) {
    _logger
      ..e('${e.message}ERR Code: ${e.code}')
      ..e('Skipping Android configuration!!!');
  } catch (e) {
    _logger
      ..w(e.toString())
      ..e('ERR Code: 255')
      ..e('Skipping Android configuration!!!');
  }
}

void _setAndroidAppName(dynamic appName) {
  try {
    if (appName == null) return;
    if (appName is! String) throw _PackageRenameErrors.invalidAppName;

    final androidManifestFile = File(_androidMainManifestFilePath);
    if (!androidManifestFile.existsSync()) {
      throw _PackageRenameErrors.androidMainManifestNotFound;
    }

    final androidManifestString = androidManifestFile.readAsStringSync();
    final newLabelAndroidManifestString = androidManifestString.replaceAll(
      RegExp('android:label="(.*)"'),
      'android:label="$appName"',
    );

    androidManifestFile.writeAsStringSync(newLabelAndroidManifestString);

    _logger.i('Android label set to: `$appName` (main AndroidManifest.xml)');
  } on _PackageRenameException catch (e) {
    _logger
      ..e('${e.message}ERR Code: ${e.code}')
      ..e('Android Label change failed!!!');
  } catch (e) {
    _logger
      ..w(e.toString())
      ..e('ERR Code: 255')
      ..e('Android Label change failed!!!');
  } finally {
    if (appName != null) _logger.wtf(_minorTaskDoneLine);
  }
}

void _setAndroidPackageName(dynamic packageName) {
  try {
    if (packageName == null) return;
    if (packageName is! String) throw _PackageRenameErrors.invalidPackageName;

    final androidManifestFilePaths = [
      _androidMainManifestFilePath,
      _androidDebugManifestFilePath,
      _androidProfileManifestFilePath,
    ];

    _setManifestPackageName(
      manifestFilePaths: androidManifestFilePaths,
      packageName: packageName,
    );

    _setBuildGradlePackageName(
      buildGradleFilePath: _androidAppLevelBuildGradleFilePath,
      packageName: packageName,
    );
  } on _PackageRenameException catch (e) {
    _logger
      ..e('${e.message}ERR Code: ${e.code}')
      ..e('Android Package change failed!!!');
  } catch (e) {
    _logger
      ..w(e.toString())
      ..e('ERR Code: 255')
      ..e('Android Package change failed!!!');
  } finally {
    if (packageName != null) _logger.wtf(_minorTaskDoneLine);
  }
}

void _setManifestPackageName({
  required List<String> manifestFilePaths,
  required String packageName,
}) {
  for (final androidManifestFilePath in manifestFilePaths) {
    final androidManifestFile = File(androidManifestFilePath);
    if (!androidManifestFile.existsSync()) {
      _logger.w(
        'AndroidManifest.xml file not found at: $androidManifestFilePath',
      );
      continue;
    }

    final androidManifestString = androidManifestFile.readAsStringSync();
    final newPackageAndroidManifestString = androidManifestString.replaceAll(
      RegExp('package="(.*?)"'),
      'package="$packageName"',
    );

    androidManifestFile.writeAsStringSync(newPackageAndroidManifestString);

    // Get directory name from path
    final dirName = androidManifestFilePath.split('/').reversed.toList()[1];

    _logger.i(
      'Android package set to: `$packageName` ($dirName AndroidManifest.xml)',
    );
  }
}

void _setBuildGradlePackageName({
  required String buildGradleFilePath,
  required String packageName,
}) {
  final buildGradleFile = File(buildGradleFilePath);
  if (!buildGradleFile.existsSync()) {
    _logger.w(
      'build.gradle file not found at: $buildGradleFilePath',
    );
    return;
  }

  final buildGradleString = buildGradleFile.readAsStringSync();
  final newPackageIDBuildGradleString = buildGradleString
      .replaceAll(
        RegExp('applicationId "(.*?)"'),
        'applicationId "$packageName"',
      )
      .replaceAll(
        RegExp("applicationId '(.*?)'"),
        'applicationId "$packageName"',
      )
      .replaceAll(
        RegExp('namespace "(.*?)"'),
        'namespace "$packageName"',
      )
      .replaceAll(
        RegExp("namespace '(.*?)'"),
        'namespace "$packageName"',
      );

  buildGradleFile.writeAsStringSync(newPackageIDBuildGradleString);

  _logger.i(
    'Android applicationId set to: `$packageName` (build.gradle)',
  );
}

void _createNewMainActivity({
  required dynamic packageName,
  dynamic lang,
}) {
  try {
    if (packageName == null) return;
    if (packageName is! String) throw _PackageRenameErrors.invalidPackageName;

    lang ??= 'kotlin';
    if (lang is! String) throw _PackageRenameErrors.invalidLanguageType;

    String fileExtension;
    switch (lang) {
      case 'kotlin':
        fileExtension = 'kt';
        break;
      case 'java':
        fileExtension = 'java';
        break;
      default:
        throw _PackageRenameErrors.invalidAndroidLanguageValue;
    }

    final packageDirs = packageName.replaceAll('.', '/');
    final langDir = '$_androidMainDirPath/$lang';

    Directory(langDir).deleteSync(recursive: true);

    final mainActivityFile = File(
      '$langDir/$packageDirs/MainActivity.$fileExtension',
    )..createSync(recursive: true);

    var fileContent = lang == 'kotlin'
        ? _androidKotlinMainActivityTemplate
        : _androidJavaMainActivityTemplate;
    fileContent = fileContent.replaceAll(
      RegExp('{{packageName}}'),
      packageName,
    );

    mainActivityFile.writeAsStringSync(fileContent);

    _logger.i('New MainActivity.${lang == 'kotlin' ? 'kt' : 'java'} created');
  } on _PackageRenameException catch (e) {
    _logger
      ..e('${e.message}ERR Code: ${e.code}')
      ..e('New MainActivity creation failed!!!');
  } catch (e) {
    _logger
      ..w(e.toString())
      ..e('ERR Code: 255')
      ..e('New MainActivity creation failed!!!');
  } finally {
    if (packageName != null) _logger.wtf(_minorTaskDoneLine);
  }
}
