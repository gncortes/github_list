import 'package:either_dart/either.dart';
import 'api_error.dart';
import 'repository.dart';

abstract class IGetRepositoriesFacade {
  Future<Either<ApiError, List<Repository>>> getRepositories();
}
