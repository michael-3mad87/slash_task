import 'externals.dart';
import 'image.dart';
import 'links.dart';
import 'network.dart';
import 'rating.dart';

class Show {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  String? premiered;
  dynamic ended;
  String? officialSite;

  Rating? rating;
  int? weight;
  Network? network;
  dynamic webChannel;
  dynamic dvdCountry;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Links? links;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

 factory Show.fromJson(Map<String, dynamic> json) => Show(
    id: _parseToInt(json['id']),
    url: json['url'] as String?,
    name: json['name'] as String?,
    type: json['type'] as String?,
    language: json['language'] as String?,
    genres: json['genres'] == null
        ? null
        : List<String>.from(json['genres'].map((item) => item.toString())),
    status: json['status'] as String?,
    runtime: _parseToInt(json['runtime']),
    averageRuntime: _parseToInt(json['averageRuntime']),
    premiered: json['premiered'] as String?,
    ended: json['ended'],
    officialSite: json['officialSite'] as String?,
    rating: json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    weight: _parseToInt(json['weight']),
    network: json['network'] == null
        ? null
        : Network.fromJson(json['network'] as Map<String, dynamic>),
    webChannel: json['webChannel'],
    dvdCountry: json['dvdCountry'],
    externals: json['externals'] == null
        ? null
        : Externals.fromJson(json['externals'] as Map<String, dynamic>),
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
    summary: json['summary'] as String?,
    updated: _parseToInt(json['updated']),
    links: json['_links'] == null
        ? null
        : Links.fromJson(json['_links'] as Map<String, dynamic>),
);

static int? _parseToInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
}
