import 'package:flutter/foundation.dart';

import 'user.dart';

class Repository {
  final String name;
  final String fullName;
  final String htmlUrl;
  final String description;
  final User user;

  const Repository({
    @required this.user,
    @required this.name,
    @required this.fullName,
    @required this.htmlUrl,
    @required this.description,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      user: User.fromJson(json["owner"]),
      name: json["name"],
      fullName: json["full_name"],
      htmlUrl: json["html_url"],
      description: json["description"],
    );
  }
}
