import 'package:flutter/foundation.dart';

import 'user.dart';

class Repository {
  final String name;
  final String htmlUrl;
  final String description;
  final User user;

  const Repository({
    @required this.user,
    @required this.name,
    @required this.htmlUrl,
    @required this.description,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      user: User.fromJson(json["owner"]),
      name: json["name"],
      htmlUrl: json["html_url"],
      description: json["description"] ?? '',
    );
  }
}
