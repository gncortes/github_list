// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeControllerBase.isLoading'))
          .value;

  final _$githubListAtom = Atom(name: '_HomeControllerBase.githubList');

  @override
  ObservableFuture<Either<ApiError, List<Repository>>> get githubList {
    _$githubListAtom.reportRead();
    return super.githubList;
  }

  @override
  set githubList(ObservableFuture<Either<ApiError, List<Repository>>> value) {
    _$githubListAtom.reportWrite(value, super.githubList, () {
      super.githubList = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  Future<Either<ApiError, List<Repository>>> getGithubList() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getGithubList');
    try {
      return super.getGithubList();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
githubList: ${githubList},
isLoading: ${isLoading}
    ''';
  }
}
