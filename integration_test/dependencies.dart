import 'package:github_list/application/home_controller.dart';
import 'package:github_list/domain/api_error.dart';
import 'package:github_list/domain/i_get_repositories_facade.dart';
import 'package:github_list/domain/repository.dart';
import 'package:either_dart/src/either.dart';

//**Classes que simula os dados que vem do repositório*
class TestRepositoryApiNotFound implements IGetRepositoriesFacade {
  @override
  Future<Either<ApiError, List<Repository>>> getRepositories() async {
    return Left(ApiError.notFound);
  }
}

class TestRepositoryServerError implements IGetRepositoriesFacade {
  @override
  Future<Either<ApiError, List<Repository>>> getRepositories() async {
    return Left(ApiError.serverError);
  }
}

class TestRepositoryWithoutInternet implements IGetRepositoriesFacade {
  @override
  Future<Either<ApiError, List<Repository>>> getRepositories() async {
    return Left(ApiError.withoutInternet);
  }
}

class TestRepositorySuccessful implements IGetRepositoriesFacade {
  @override
  Future<Either<ApiError, List<Repository>>> getRepositories() async {
    return Right(List<Repository>.from([
      Repository.fromJson(
        {
          'name': 'github_list',
          "html_url": 'https://github.com/gncortes/github_list',
          "description":
              'Um aplicativo que lista os 100 primeiros repositórios do GitHub',
          "owner": {
            "avatar_url":
                'https://avatars0.githubusercontent.com/u/56210501?s=400&u=18756e79bd7df7add1a337bb93bc5be85b556263&v=4.jpg',
            "login": 'gncortes',
          }
        },
      ),
    ]));
  }
}

final controllerApiNotFound = HomeController(TestRepositoryApiNotFound());
final controllerServerError = HomeController(TestRepositoryServerError());
final controllerWithoutInternet =
    HomeController(TestRepositoryWithoutInternet());
final controllerSuccessfull = HomeController(TestRepositorySuccessful());
