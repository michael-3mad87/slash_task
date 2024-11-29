import 'nextepisode.dart';
import 'previousepisode.dart';

class Links {
	
	Previousepisode? previousepisode;
	Nextepisode? nextepisode;

	Links({this.previousepisode, this.nextepisode});

	factory Links.fromJson(Map<String, dynamic> json) => Links(
				
				previousepisode: json['previousepisode'] == null
						? null
						: Previousepisode.fromJson(json['previousepisode'] as Map<String, dynamic>),
				nextepisode: json['nextepisode'] == null
						? null
						: Nextepisode.fromJson(json['nextepisode'] as Map<String, dynamic>),
			);

	
}
