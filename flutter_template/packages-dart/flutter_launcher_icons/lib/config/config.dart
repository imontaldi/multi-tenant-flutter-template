import 'package:flutter_launcher_icons/constants.dart' as constants;
import 'package:json_annotation/json_annotation.dart';
part 'config.g.dart';

/// A model representing the flutter_launcher_icons configuration
@JsonSerializable(
  anyMap: true,
  checked: true,
)
class Config {
  /// Creates an instance of [Config]
  const Config({
    this.imagePath,
    this.android = true,
    this.ios = true,
    this.imagePathAndroid,
    this.imagePathIOS,
    this.adaptiveIconForeground,
    this.adaptiveIconBackground,
    this.minSdkAndroid = constants.androidDefaultAndroidMinSDK,
    this.removeAlphaIOS = true,
    this.backgroundColorIOS = '#ffffff',
  });

  /// Generic image_path
  @JsonKey(name: 'image_path')
  final String? imagePath;

  /// Returns true or path if android config is enabled
  final bool android; // path or bool

  /// Returns true or path if ios config is enabled
  final dynamic ios; // path or bool

  /// Image path specific to android
  @JsonKey(name: 'image_path_android')
  final String? imagePathAndroid;

  /// Image path specific to ios
  @JsonKey(name: 'image_path_ios')
  final String? imagePathIOS;

  /// android adaptive icon foreground image
  @JsonKey(name: 'adaptive_icon_foreground')
  final String? adaptiveIconForeground;

  /// android adaptive_icon_background image
  @JsonKey(name: 'adaptive_icon_background')
  final String? adaptiveIconBackground;

  /// Android min_sdk_android
  @JsonKey(name: 'min_sdk_android')
  final int minSdkAndroid;

  /// IOS remove_alpha_ios
  @JsonKey(name: 'remove_alpha_ios')
  final bool removeAlphaIOS;

  /// IOS background_color_ios
  @JsonKey(name: 'background_color_ios')
  final String backgroundColorIOS;

  /// Creates [Config] icons from [json]
  factory Config.fromJson(Map json) => _$ConfigFromJson(json);

  /// whether or not there is configuration for adaptive icons for android
  bool get hasAndroidAdaptiveConfig =>
      isNeedingNewAndroidIcon &&
      adaptiveIconForeground != null &&
      adaptiveIconBackground != null;

  /// Checks if contains any platform config
  bool get hasPlatformConfig {
    return ios != false || android != false;
  }

  /// Check to see if specified Android config is a string or bool
  /// String - Generate new launcher icon with the string specified
  /// bool - override the default flutter project icon
  bool get isCustomAndroidFile => android is String;

  /// if we are needing a new Android icon
  bool get isNeedingNewAndroidIcon => android != false;

  /// if we are needing a new iOS icon
  bool get isNeedingNewIOSIcon => ios != false;

  /// Method for the retrieval of the Android icon path
  /// If image_path_android is found, this will be prioritised over the image_path
  /// value.
  String? getImagePathAndroid() => imagePathAndroid ?? imagePath;

  // TODO(RatakondalaArun): refactor after Android & iOS configs will be refactored to the new schema
  // https://github.com/fluttercommunity/flutter_launcher_icons/issues/394
  /// get the image path for IOS
  String? getImagePathIOS() => imagePathIOS ?? imagePath;
}
