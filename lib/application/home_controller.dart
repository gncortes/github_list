import 'package:either_dart/either.dart';
import 'package:github_list/domain/api_error.dart';
import 'package:github_list/domain/i_get_repositories_facade.dart';
import 'package:github_list/domain/repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IGetRepositoriesFacade _facade;

  _HomeControllerBase(this._facade) {
    getGithubList();
  }

  @observable
  ObservableFuture<Either<ApiError, List<Repository>>> githubList;
  @action
  Future<Either<ApiError, List<Repository>>> getGithubList() {
    return githubList = ObservableFuture(
      _facade.getRepositories().asObservable(),
    );
  }

  @computed
  bool get isLoading {
    if (githubList == null) return true;
    switch (githubList.status) {
      case FutureStatus.pending:
        return true;
      default:
        return false;
    }
  }
}
