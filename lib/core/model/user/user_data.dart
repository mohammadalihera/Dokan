import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  String? token;
  String? user_email;
  String? user_nicename;
  String? user_display_name;

  UserData({this.token, this.user_email, this.user_display_name, this.user_nicename});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token ?? "",
      'user_email': user_email ?? "",
      'user_nicename': user_nicename ?? "",
      'user_display_name': user_display_name ?? "",
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      token: map['token'] as String,
      user_email: map['user_email'] as String,
      user_nicename: map['user_nicename'] as String,
      user_display_name: map['user_display_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserData(token: $token, user_email: $user_email, user_nicename,: $user_nicename,user_display_name:$user_display_name)';
}
