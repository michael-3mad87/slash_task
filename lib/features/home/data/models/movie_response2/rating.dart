class Rating {
	int? average;

	Rating({this.average});

	factory Rating.fromJson(Map<String, dynamic> json) => Rating(
				average:_parseToInt(json['average']),
			);

	Map<String, dynamic> toJson() => {
				'average': average,
			};

       static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }
}
