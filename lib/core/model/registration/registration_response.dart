import 'package:json_annotation/json_annotation.dart';
import 'package:product_show_case/core/model/registration/registration_data.dart';

part 'registration_response.g.dart';

@JsonSerializable()
class RegistrationResponse {
  RegistrationData? data;

  RegistrationResponse({this.data});
  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}
