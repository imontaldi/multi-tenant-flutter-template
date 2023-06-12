part of package_rename;

class _PackageRenameException implements Exception {
  const _PackageRenameException(this.message, this.code);

  final String message;
  final int code;
}

class _PackageRenameErrors {
  static const filesNotFound = _PackageRenameException(
    _filesNotFoundMessage,
    1,
  );

  static const configNotFound = _PackageRenameException(
    _configNotFoundMessage,
    2,
  );

  static const invalidConfig = _PackageRenameException(
    _invalidConfigMessage,
    3,
  );

  static const invalidAndroidConfig = _PackageRenameException(
    _invalidAndroidConfigMessage,
    4,
  );

  static const invalidAppName = _PackageRenameException(
    _invalidAppNameMessage,
    5,
  );

  static const androidMainManifestNotFound = _PackageRenameException(
    _androidMainManifestNotFoundMessage,
    6,
  );

  static const invalidPackageName = _PackageRenameException(
    _invalidPackageNameMessage,
    7,
  );

  static const iosInfoPlistNotFound = _PackageRenameException(
    _iosInfoPlistNotFoundMessage,
    9,
  );

  static const invalidBundleName = _PackageRenameException(
    _invalidBundleNameMessage,
    10,
  );

  static const iosProjectFileNotFound = _PackageRenameException(
    _iosProjectFileNotFoundMessage,
    11,
  );

  static const invalidLanguageType = _PackageRenameException(
    _invalidLanguageTypeMessage,
    26,
  );

  static const invalidAndroidLanguageValue = _PackageRenameException(
    _invalidAndroidLangValueMessage,
    27,
  );

  static const androidOldDirectoryNotFound = _PackageRenameException(
    _androidOldDirectoryNotFoundMessage,
    30,
  );

  static _PackageRenameException flavourNotFound(String flavor) {
    final flavorNotFoundMessage = _configNotFoundMessage
        .replaceFirst('package_rename_config', 'package_rename_config-$flavor')
        .replaceRange(1, 1, '═' * (flavor.length + 1))
        .replaceRange(
          _configNotFoundMessage.length - 2,
          _configNotFoundMessage.length - 2,
          '═' * (flavor.length + 1),
        );

    return _PackageRenameException(flavorNotFoundMessage, 31);
  }
}
