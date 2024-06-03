import 'package:json_annotation/json_annotation.dart';

part 'registration_data.g.dart';

@JsonSerializable()
class RegistrationData {
  int? code;
  String? message;

  RegistrationData({this.code, this.message});
  factory RegistrationData.fromJson(Map<String, dynamic> json) => _$RegistrationDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationDataToJson(this);
}
