class Previousepisode {
  String? href;
  String? name;

  Previousepisode({this.href, this.name});

  factory Previousepisode.fromJson(Map<String, dynamic> json) {
    return Previousepisode(
      href: json['href'] as String?,
      name: json['name'] as String?,
    );
  }
}
