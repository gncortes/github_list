import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:github_list/domain/api_error.dart';
import 'package:github_list/domain/i_get_repositories_facade.dart';
import 'package:github_list/domain/repository.dart';

class DioGetRepositories implements IGetRepositoriesFacade {
  final _dio = Dio();
  @override
  Future<Either<ApiError, List<Repository>>> getRepositories() async {
    try {
      final response = await _dio.get('https://api.github.com/repositories');
      switch (response.statusCode) {
        case 200:
          List repositoriesJsonList = response.data;
          if (repositoriesJsonList.isEmpty) return Left(ApiError.notFound);
          List<Repository> listRepositories = repositoriesJsonList
              .map((e) => Repository.fromJson(e))
              .take(100)
              .toList();
          return Right(listRepositories);
        case 404:
          return Left(ApiError.notFound);
        default:
          return Left(ApiError.serverError);
      }
    } on DioError catch (e) {
      if (DioErrorType.RECEIVE_TIMEOUT == e.type ||
          DioErrorType.CONNECT_TIMEOUT == e.type) {
        return Left(ApiError.withoutInternet);
      } else {
        return Left(ApiError.notFound);
      }
    } catch (e) {
      return Left(ApiError.notFound);
    }
  }
}
