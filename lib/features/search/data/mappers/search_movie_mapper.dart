import 'package:slash_task/features/home/data/models/movie_response2/show.dart';
import 'package:slash_task/features/search/domain/entity/search_movie.dart';

extension SearchMoviesMapper on Show {
  SearchMovie get toEntity => SearchMovie(
      id: id,
      name: name,
      image: image?.original,
      image2: image?.medium,
      summary: summary,
      genres: genres,
      premiered: premiered,
      runtime: runtime,
      rating: rating
      );
}