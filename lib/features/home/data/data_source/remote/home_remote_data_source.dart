import 'package:slash_task/features/home/data/models/movie_response2/movie_response2.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieResponse>> getMovies();
}
