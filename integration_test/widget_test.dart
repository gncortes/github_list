import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_list/presentation/home/components/error_component.dart';
import 'package:github_list/presentation/home/components/repository_component.dart';
import 'package:github_list/presentation/home/home_page.dart';
import 'package:integration_test/integration_test.dart';

import 'dependencies.dart';

Widget makeTestable(Widget widget) => MaterialApp(
      home: widget,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'Testando erro de repositórios não encontrados',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(
        HomePage(controller: controllerApiNotFound),
      ));
      expect(
        find.text('Primeiros 100 repositórios criados no GitHub'),
        findsOneWidget,
      );
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(Duration(milliseconds: 300));
      controllerApiNotFound.getGithubList().then((value) {
        expect(find.byType(ErrorComponent), findsOneWidget);
        expect(
          find.text(
              'Não foi possível encontrar a lista de repositórios, tente novamente.'),
          findsOneWidget,
        );
      });
      await tester.pump(Duration(milliseconds: 300));
    },
  );
  testWidgets(
    'Testando erro de servidor',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(
        HomePage(controller: controllerServerError),
      ));
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(Duration(milliseconds: 300));
      controllerServerError.getGithubList().then((value) {
        expect(find.byType(ErrorComponent), findsOneWidget);
        expect(
          find.text('Aconteceu um erro no servidor, tente novamente.'),
          findsOneWidget,
        );
      });
      await tester.pump(Duration(milliseconds: 300));
    },
  );
  testWidgets(
    'Testando erro de conexão com a internet',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(
        HomePage(
          controller: controllerWithoutInternet,
        ),
      ));
      expect(
        find.text('Primeiros 100 repositórios criados no GitHub'),
        findsOneWidget,
      );
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(Duration(milliseconds: 300));
      controllerWithoutInternet.getGithubList().then((value) {
        expect(find.byType(ErrorComponent), findsOneWidget);
        expect(
          find.text(
              'Não foi possível se conectar com o servidor, verifique sua conexão com a internet.'),
          findsOneWidget,
        );
      });
      await tester.pump(Duration(milliseconds: 300));
    },
  );
  testWidgets(
    'Testando quando pega todos os repositórios',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(
        HomePage(controller: controllerSuccessfull),
      ));
      expect(
        find.text('Primeiros 100 repositórios criados no GitHub'),
        findsOneWidget,
      );
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(Duration(milliseconds: 300));
      controllerSuccessfull.getGithubList().then((value) {
        expect(find.byType(ErrorComponent), findsNothing);
        expect(find.byType(RepositoryComponent), findsOneWidget);
      });
    },
  );
}
