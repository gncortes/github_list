import 'package:flutter/foundation.dart';

class User {
  final String avatarUrl;

  const User({@required this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(avatarUrl: json["avatar_url"]);
  }
}
