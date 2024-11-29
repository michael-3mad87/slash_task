import 'package:slash_task/features/home/data/models/movie_response2/rating.dart';

class SearchMovie {
  final int? id;
  final String? name;
  final String? image;
  final String? image2;
  final String? summary;
  final List<String>? genres;
 final String? premiered;
 final int? runtime;
 final Rating ?rating;

  SearchMovie({
    required this.id,
    required this.name,
    required this.image,
    required this.image2,
    required this.summary,
    required this.genres,
    required this.premiered,
    required this.runtime,
    required this.rating,
  });
}