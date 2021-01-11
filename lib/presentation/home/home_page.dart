import 'package:flutter/material.dart';
import 'package:github_list/application/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_list/presentation/home/components/repository_component.dart';

import 'components/error_component.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({Key key, @required this.controller}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(controller);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    controller.getGithubList();
  }

  final HomeController controller;

  _HomePageState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        elevation: 0,
        title: Text(
          'Primeiros 100 repositórios criados no GitHub',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          } else {
            return controller.githubList.value.unite(
              (left) => Center(
                child: ErrorComponent(
                  error: left,
                  onPressed: controller.getGithubList,
                ),
              ),
              (right) => ListView.builder(
                itemCount: right.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      RepositoryComponent(
                        repository: right[index],
                      ),
                      Divider(
                        thickness: 0.5,
                        height: 0.5,
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
