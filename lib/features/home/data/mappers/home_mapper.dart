import 'package:slash_task/features/home/data/models/movie_response2/show.dart';

import 'package:slash_task/features/home/domain/entities/movies.dart';

extension MoviesMapper on Show {
  Movies get toEntity => Movies(
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
