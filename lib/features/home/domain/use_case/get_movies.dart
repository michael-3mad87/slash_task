import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slash_task/core/error/failure.dart';

import 'package:slash_task/features/home/domain/entities/movies.dart';
import 'package:slash_task/features/home/domain/repository/home_repository.dart';

@LazySingleton()
class GetMovies {
  final HomeRepository homeRepository;
  
  GetMovies(this.homeRepository);
  Future<Either<Failure, List<Movies>>> call() => 
      homeRepository.getMovies();
  
}