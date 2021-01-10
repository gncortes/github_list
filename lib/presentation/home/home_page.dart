import 'package:flutter/material.dart';
import 'package:github_list/application/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({Key key, @required this.controller}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(controller);
}

class _HomePageState extends State<HomePage> {
  final HomeController controller;

  _HomePageState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeiros 100 repositórios do GitHub'),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Carregando lista de repositórios'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          } else
            return controller.githubList.value.unite(
              (left) => Text('Deu erro'),
              (right) => Text('Tudo ok'),
            );
        },
      ),
    );
  }
}
