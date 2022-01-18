import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_configs.g.dart';

@JsonSerializable()
class AppConfiguration {
  static final AppConfiguration instance = AppConfiguration._();

  /// region firebase configuration

  /// region firebase configuration android
  late final String firebaseAndroidApiKey;
  late final String firebaseAndroidAppId;
  late final String firebaseAndroidMessagingSenderId;
  late final String firebaseAndroidProjectId;
  late final String firebaseAndroidStorageBucket;

  /// endregion

  /// region firebase configuration iOS
  late final String firebaseIosApiKey;
  late final String firebaseIosAppId;
  late final String firebaseIosMessagingSenderId;
  late final String firebaseIosProjectId;
  late final String firebaseIosStorageBucket;
  late final String firebaseIosClientId;
  late final String firebaseIosBundleId;

  /// endregion

  late final String sentryDSN;

  /// endregion

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  AppConfiguration._();

  factory AppConfiguration() {
    return instance;
  }

  factory AppConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AppConfigurationFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AppConfigurationToJson(this);

  /// Initialize the application configs
  Future<void> initialize() async {
    if (!_isInitialized) {
      await dotenv.load(fileName: '.env');

      await loadSettings();

      _isInitialized = true;
    }
  }

  Future<void> loadSettings() async {
    firebaseAndroidApiKey =
        dotenv.env['FIREBASE_ANDROID_API_KEY'] ?? 'not-setup-correctly';
    firebaseAndroidAppId =
        dotenv.env['FIREBASE_ANDROID_APP_ID'] ?? 'not-setup-correctly';
    firebaseAndroidMessagingSenderId =
        dotenv.env['FIREBASE_ANDROID_MESSAGING_SENDER_ID'] ??
            'not-setup-correctly';
    firebaseAndroidProjectId =
        dotenv.env['FIREBASE_ANDROID_PROJECT_ID'] ?? 'not-setup-correctly';
    firebaseAndroidStorageBucket =
        dotenv.env['FIREBASE_ANDROID_STORAGE_BUCKET'] ?? 'not-setup-correctly';

    firebaseIosApiKey =
        dotenv.env['FIREBASE_IOS_API_KEY'] ?? 'not-setup-correctly';
    firebaseIosAppId =
        dotenv.env['FIREBASE_IOS_APP_ID'] ?? 'not-setup-correctly';
    firebaseIosMessagingSenderId =
        dotenv.env['FIREBASE_IOS_MESSAGING_SENDER_ID'] ?? 'not-setup-correctly';
    firebaseIosProjectId =
        dotenv.env['FIREBASE_IOS_PROJECT_ID'] ?? 'not-setup-correctly';
    firebaseIosStorageBucket =
        dotenv.env['FIREBASE_IOS_STORAGE_BUCKET'] ?? 'not-setup-correctly';
    firebaseIosClientId =
        dotenv.env['FIREBASE_IOS_CLIENT_ID'] ?? 'not-setup-correctly';
    firebaseIosBundleId =
        dotenv.env['FIREBASE_IOS_BUNDLE_ID'] ?? 'not-setup-correctly';

    sentryDSN = dotenv.env['SENTRY_DSN'] ?? 'not-setup-correctly';
  }
}
