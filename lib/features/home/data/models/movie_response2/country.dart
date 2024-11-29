class Country {
	String? name;
	String? code;
	String? timezone;

	Country({this.name, this.code, this.timezone});

	factory Country.fromJson(Map<String, dynamic> json) => Country(
				name: json['name'] as String?,
				code: json['code'] as String?,
				timezone: json['timezone'] as String?,
			);


}
