import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:github_list/domain/api_error.dart';
import 'package:github_list/domain/i_get_repositories_facade.dart';
import 'package:github_list/domain/repository.dart';

class DioGetRepositories implements IGetRepositoriesFacade {
  final _dio = Dio();
  @override
  Future<Either<ApiError, List<Repository>>> getRepositories() async {
    final response = await _dio.get('https://api.github.com/repositories');
    print(response.data);
    return Left(ApiError.serverError);
  }
}
