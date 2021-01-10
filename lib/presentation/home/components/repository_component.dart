import 'package:flutter/material.dart';
import 'package:github_list/domain/repository.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryComponent extends StatelessWidget {
  final Repository repository;

  const RepositoryComponent({Key key, @required this.repository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const textStyle1 = TextStyle(
      fontSize: 14,
      color: Colors.white70,
    );
    const symmetricPadding = const EdgeInsets.symmetric(
      vertical: 2.0,
    );
    return RaisedButton(
      color: Colors.black54,
      padding: const EdgeInsets.all(16),
      onPressed: () {
        launch(repository.htmlUrl);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Image.network(repository.user.avatarUrl, height: 24,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else
                    return SizedBox(
                      height: 24,
                      width: 24,
                      child: LinearProgressIndicator(),
                    );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  repository.user.login,
                  style: textStyle1,
                ),
              ),
            ],
          ),
          Padding(
            padding: symmetricPadding,
            child: Text(
              repository.name,
            ),
          ),
          Padding(
            padding: symmetricPadding,
            child: Text(
              repository.description,
              style: textStyle1,
            ),
          ),
        ],
      ),
    );
  }
}
