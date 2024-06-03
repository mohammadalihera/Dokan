import 'package:json_annotation/json_annotation.dart';

part 'registration_response.g.dart';

@JsonSerializable()
class RegistrationResponse {
  bool? status;
  int? statusCode;
  String? message;

  RegistrationResponse({this.status, this.statusCode, this.message});
  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}
