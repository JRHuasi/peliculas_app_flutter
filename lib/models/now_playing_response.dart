// To parse this JSON data, do
//
//     final nowPlayinResponse = nowPlayinResponseFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class NowPlayinResponse {
	NowPlayinResponse({
			required this.dates,
			required this.page,
			required this.results,
			required this.totalPages,
			required this.totalResults,
	});

	Dates dates;
	int page;
	List<Movie> results;
	int totalPages;
	int totalResults;

	factory NowPlayinResponse.fromJson(String str) => NowPlayinResponse.fromMap(json.decode(str));

	factory NowPlayinResponse.fromMap(Map<String, dynamic> json) => NowPlayinResponse(
			dates: Dates.fromMap(json["dates"]),
			page: json["page"],
			results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
			totalPages: json["total_pages"],
			totalResults: json["total_results"],
	);

}

class Dates {
    Dates({
			required this.maximum,
			required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toMap() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}
