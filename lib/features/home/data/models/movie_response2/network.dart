import 'country.dart';

class Network {
	int? id;
	String? name;
	Country? country;
	String? officialSite;

	Network({this.id, this.name, this.country, this.officialSite});

	factory Network.fromJson(Map<String, dynamic> json) => Network(
				id: json['id'] as int?,
				name: json['name'] as String?,
				country: json['country'] == null
						? null
						: Country.fromJson(json['country'] as Map<String, dynamic>),
				officialSite: json['officialSite'] as String?,
			);

	
}
