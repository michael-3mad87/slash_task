// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:slash_task/core/di/request_module.dart' as _i133;
import 'package:slash_task/features/home/data/data_source/remote/home_remote_api_data_source.dart'
    as _i387;
import 'package:slash_task/features/home/data/data_source/remote/home_remote_data_source.dart'
    as _i185;
import 'package:slash_task/features/home/data/repository/home_repository_impl.dart'
    as _i467;
import 'package:slash_task/features/home/domain/repository/home_repository.dart'
    as _i743;
import 'package:slash_task/features/home/domain/use_case/get_movies.dart'
    as _i660;
import 'package:slash_task/features/home/presentation/cubit/home_cubit.dart'
    as _i431;
import 'package:slash_task/features/search/data/data_source/search_remote_api_data_source.dart'
    as _i883;
import 'package:slash_task/features/search/data/data_source/search_remote_data_source.dart'
    as _i835;
import 'package:slash_task/features/search/data/repository/search_repository_impl.dart'
    as _i326;
import 'package:slash_task/features/search/domain/repository/search_repository.dart'
    as _i232;
import 'package:slash_task/features/search/domain/use_case/get_search_movies.dart'
    as _i279;
import 'package:slash_task/features/search/presentation/cubit/search_cubit.dart'
    as _i955;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i185.HomeRemoteDataSource>(
        () => _i387.HomeRemoteApiDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i835.SearchRemoteDataSource>(
        () => _i883.SearchRemoteApiDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i232.SearchRepository>(
        () => _i326.SearchRepositoryImpl(gh<_i835.SearchRemoteDataSource>()));
    gh.lazySingleton<_i279.GetSearchMovies>(
        () => _i279.GetSearchMovies(gh<_i232.SearchRepository>()));
    gh.lazySingleton<_i955.SearchCubit>(
        () => _i955.SearchCubit(gh<_i279.GetSearchMovies>()));
    gh.lazySingleton<_i743.HomeRepository>(
        () => _i467.HomeRepositoryImpl(gh<_i185.HomeRemoteDataSource>()));
    gh.lazySingleton<_i660.GetMovies>(
        () => _i660.GetMovies(gh<_i743.HomeRepository>()));
    gh.lazySingleton<_i431.HomeCubit>(
        () => _i431.HomeCubit(gh<_i660.GetMovies>()));
    return this;
  }
}

class _$RegisterModule extends _i133.RegisterModule {}
