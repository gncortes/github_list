import 'package:flutter/material.dart';
import 'package:github_list/application/home_controller.dart';
import 'package:github_list/infraestructure/dio_get_repositories.dart';

import 'home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repositórios do Github',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(
        controller: HomeController(
          DioGetRepositories(),
        ),
      ),
    );
  }
}
