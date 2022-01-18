// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_configs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfiguration _$AppConfigurationFromJson(Map<String, dynamic> json) =>
    AppConfiguration()
      ..firebaseAndroidApiKey = json['firebaseAndroidApiKey'] as String
      ..firebaseAndroidAppId = json['firebaseAndroidAppId'] as String
      ..firebaseAndroidMessagingSenderId =
          json['firebaseAndroidMessagingSenderId'] as String
      ..firebaseAndroidProjectId = json['firebaseAndroidProjectId'] as String
      ..firebaseAndroidStorageBucket =
          json['firebaseAndroidStorageBucket'] as String
      ..firebaseIosApiKey = json['firebaseIosApiKey'] as String
      ..firebaseIosAppId = json['firebaseIosAppId'] as String
      ..firebaseIosMessagingSenderId =
          json['firebaseIosMessagingSenderId'] as String
      ..firebaseIosProjectId = json['firebaseIosProjectId'] as String
      ..firebaseIosStorageBucket = json['firebaseIosStorageBucket'] as String
      ..firebaseIosClientId = json['firebaseIosClientId'] as String
      ..firebaseIosBundleId = json['firebaseIosBundleId'] as String
      ..sentryDSN = json['sentryDSN'] as String;

Map<String, dynamic> _$AppConfigurationToJson(AppConfiguration instance) =>
    <String, dynamic>{
      'firebaseAndroidApiKey': instance.firebaseAndroidApiKey,
      'firebaseAndroidAppId': instance.firebaseAndroidAppId,
      'firebaseAndroidMessagingSenderId':
          instance.firebaseAndroidMessagingSenderId,
      'firebaseAndroidProjectId': instance.firebaseAndroidProjectId,
      'firebaseAndroidStorageBucket': instance.firebaseAndroidStorageBucket,
      'firebaseIosApiKey': instance.firebaseIosApiKey,
      'firebaseIosAppId': instance.firebaseIosAppId,
      'firebaseIosMessagingSenderId': instance.firebaseIosMessagingSenderId,
      'firebaseIosProjectId': instance.firebaseIosProjectId,
      'firebaseIosStorageBucket': instance.firebaseIosStorageBucket,
      'firebaseIosClientId': instance.firebaseIosClientId,
      'firebaseIosBundleId': instance.firebaseIosBundleId,
      'sentryDSN': instance.sentryDSN,
    };
