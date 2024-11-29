class Image {
	String? medium;
	String? original;

	Image({this.medium, this.original});

	factory Image.fromJson(Map<String, dynamic> json) => Image(
				medium: json['medium'] as String?,
				original: json['original'] as String?,
			);


}
