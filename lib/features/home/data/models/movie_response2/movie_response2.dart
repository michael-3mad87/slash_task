import 'show.dart';

class MovieResponse {
  double? score;
  Show? show;

  MovieResponse({this.score, this.show});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      score: (json['score'] as num?)?.toDouble(),
      show: json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
    );
  }
}
