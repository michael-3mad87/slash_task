class Nextepisode {
	String? href;
	String? name;

	Nextepisode({this.href, this.name});

	factory Nextepisode.fromJson(Map<String, dynamic> json) => Nextepisode(
				href: json['href'] as String?,
				name: json['name'] as String?,
			);

	
}
