// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationResponse _$RegistrationResponseFromJson(
        Map<String, dynamic> json) =>
    RegistrationResponse(
      status: json['status'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RegistrationResponseToJson(
        RegistrationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
