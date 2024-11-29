import 'package:dartz/dartz.dart';
import 'package:slash_task/core/error/failure.dart';
import 'package:slash_task/features/home/domain/entities/movies.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Movies>>> getMovies();
}
