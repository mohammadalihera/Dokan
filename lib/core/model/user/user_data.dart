import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  String? token;
  int? id;
  String? user_email;
  String? email;
  String? user_nicename;
  String? user_display_name;
  String? first_name;
  String? last_name;

  UserData({
    this.token,
    this.user_email,
    this.user_display_name,
    this.user_nicename,
    this.email,
    this.id,
    this.first_name,
    this.last_name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token ?? "",
      'id': id,
      'user_email': user_email ?? "",
      'email': email ?? "",
      'user_nicename': user_nicename ?? "",
      'first_name': first_name ?? "",
      'last_name': last_name ?? "",
      'user_display_name': user_display_name ?? "",
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      token: map['token'] != null ? map['token'] as String : "",
      id: map['id'] as int?,
      user_email: map['user_email'] != null ? map['user_email'] as String : "",
      email: map['email'] != null ? map['email'] as String : "",
      user_nicename: map['user_nicename'] != null ? map['user_nicename'] as String : "",
      first_name: map['first_name'] != null ? map['first_name'] as String : "",
      last_name: map['last_name'] != null ? map['last_name'] as String : "",
      user_display_name: map['user_display_name'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  static UserData copyFrom(
    UserData user,
  ) {
    UserData userData = UserData();

    userData.id = user.id;
    userData.token = user.token;
    userData.email = user.email != "" || user.email != null ? user.email : user.user_email;
    userData.user_email = user.user_email != "" || user.user_email != null ? user.user_email : user.email;
    userData.first_name = user.first_name;
    userData.last_name = user.last_name;
    userData.user_display_name = user.user_display_name;
    userData.user_nicename = user.user_nicename;

    return userData;
  }

  @override
  String toString() =>
      'UserData(token: $token, id: $id, user_email: $user_email, email: $email, user_nicename,: $user_nicename,user_display_name:$user_display_name, first_name: $first_name, last_name: $last_name)';
}
