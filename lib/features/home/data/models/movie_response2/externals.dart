class Externals {
  dynamic tvrage;
  int? thetvdb;
  String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json['tvrage'],
        thetvdb: _parseToInt(json['thetvdb']),
        imdb: json['imdb'] as String?,
      );

  // Helper method to handle int parsing
  static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }
}