part of package_rename;

const _successMessage = '''
╔═════════════════════════════════════════════════════════════╗
║    🥳🥳🥳 Done! Now go ahead and build your app 🥳🥳🥳      ║
╚═════════════════════════════════════════════════════════════╝
''';

const _invalidAppNameMessage = '''
╔═══════════════════════════════════════════╗
║   app_name (App Name) must be a String.   ║
╚═══════════════════════════════════════════╝
''';

const _androidMainManifestNotFoundMessage = '''
╔═══════════════════════════════════════════════════════════════╗
║   AndroidManifest.xml not found in `android/app/src/main/`.   ║
╚═══════════════════════════════════════════════════════════════╝
''';

const _invalidPackageNameMessage = '''
╔═══════════════════════════════════════════════════╗
║   package_name (Package Name) must be a String.   ║
╚═══════════════════════════════════════════════════╝
''';

const _iosInfoPlistNotFoundMessage = '''
╔════════════════════════════════════════════╗
║   Info.plist not found in `ios/Runner/`.   ║
╚════════════════════════════════════════════╝
''';

const _invalidBundleNameMessage = '''
╔═════════════════════════════════════════════════╗
║   bundle_name (Bundle Name) must be a String.   ║
╚═════════════════════════════════════════════════╝
''';

const _iosProjectFileNotFoundMessage = '''
╔═══════════════════════════════════════════════════════════╗
║   project.pbxproj not found in `ios/Runner.xcodeproj/`.   ║
╚═══════════════════════════════════════════════════════════╝
''';

const _invalidLanguageTypeMessage = '''
╔═══════════════════════════════════════╗
║   lang (Language) must be a String.   ║
╚═══════════════════════════════════════╝
''';

const _invalidAndroidLangValueMessage = '''
╔════════════════════════════════════════════════════════╗
║   lang (Language) must be either 'kotlin' or 'java'.   ║
╚════════════════════════════════════════════════════════╝
''';
