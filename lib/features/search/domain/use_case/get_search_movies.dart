import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slash_task/core/error/failure.dart';
import 'package:slash_task/features/search/domain/entity/search_movie.dart';
import 'package:slash_task/features/search/domain/repository/search_repository.dart';

@lazySingleton
class GetSearchMovies {
  final SearchRepository searchRepository;
  GetSearchMovies(this.searchRepository);
  Future<Either<Failure, List<SearchMovie>>> call(query) => 
      searchRepository.getMovies(query);
}
