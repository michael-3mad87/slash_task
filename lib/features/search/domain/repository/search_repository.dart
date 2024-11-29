import 'package:dartz/dartz.dart';
import 'package:slash_task/core/error/failure.dart';

import 'package:slash_task/features/search/domain/entity/search_movie.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchMovie>>> getMovies(String query );
}