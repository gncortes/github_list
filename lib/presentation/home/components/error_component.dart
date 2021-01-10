import 'package:flutter/material.dart';
import 'package:github_list/domain/api_error.dart';

class ErrorComponent extends StatelessWidget {
  final ApiError error;
  final VoidCallback onPressed;
  const ErrorComponent(
      {Key key, @required this.error, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: Text(
            textError,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton.icon(
            onPressed: onPressed,
            icon: Icon(
              Icons.loop,
            ),
            label: Text('Tentar novamente'),
          ),
        )
      ],
    );
  }

  String get textError {
    switch (error) {
      case ApiError.withoutInternet:
        return 'Não foi possível se conectar com o servidor, verifique sua conexão com a internet.';
      case ApiError.notFound:
        return 'Não foi possível encontrar a lista de repositórios, tente novamente.';
      default:
        return 'Aconteceu um erro no servidor, tente novamente.';
    }
  }
}
