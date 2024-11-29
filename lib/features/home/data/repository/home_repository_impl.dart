import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slash_task/core/error/exception.dart';
import 'package:slash_task/core/error/failure.dart';
import 'package:slash_task/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:slash_task/features/home/data/mappers/home_mapper.dart';

import 'package:slash_task/features/home/domain/entities/movies.dart';
import 'package:slash_task/features/home/domain/repository/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

@override
  Future<Either<Failure, List<Movies>>> getMovies() async {
    try {
     
      final response = await homeRemoteDataSource.getMovies();


      final movies = response
          .map((movieResponse) => movieResponse.show!.toEntity) 
          .toList();

      return Right(movies);
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }
}

