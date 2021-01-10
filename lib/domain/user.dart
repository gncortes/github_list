import 'package:flutter/foundation.dart';

class User {
  final String avatarUrl;
  final String login;

  const User({@required this.avatarUrl, @required this.login});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(avatarUrl: json["avatar_url"], login: json["login"]);
  }
}
