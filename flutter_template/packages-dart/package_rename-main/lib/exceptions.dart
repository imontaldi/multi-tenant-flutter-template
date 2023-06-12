part of package_rename;

class _PackageRenameException implements Exception {
  const _PackageRenameException(this.message, this.code);

  final String message;
  final int code;
}

class _PackageRenameErrors {
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
}
