import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slash_task/core/error/exception.dart';
import 'package:slash_task/core/error/failure.dart';

import 'package:slash_task/features/search/data/data_source/search_remote_data_source.dart';
import 'package:slash_task/features/search/data/mappers/search_movie_mapper.dart';
import 'package:slash_task/features/search/domain/entity/search_movie.dart';
import 'package:slash_task/features/search/domain/repository/search_repository.dart';
@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository{
  SearchRemoteDataSource searchRemoteDataSource ;
  SearchRepositoryImpl(this.searchRemoteDataSource);
  @override
  Future<Either<Failure, List<SearchMovie>>> getMovies(String query) async{
   try {
     
      final response = await searchRemoteDataSource.getMovies(query);


      final movies = response
          .map((movieResponse) => movieResponse.show!.toEntity) 
          .toList();

      return Right(movies);
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
    
  }

}