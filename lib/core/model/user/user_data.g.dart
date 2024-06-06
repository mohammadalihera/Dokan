// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      token: json['token'] as String?,
      user_email: json['user_email'] as String?,
      user_display_name: json['user_display_name'] as String?,
      user_nicename: json['user_nicename'] as String?,
      email: json['email'] as String?,
      id: (json['id'] as num?)?.toInt(),
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'user_email': instance.user_email,
      'email': instance.email,
      'user_nicename': instance.user_nicename,
      'user_display_name': instance.user_display_name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };
