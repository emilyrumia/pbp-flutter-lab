import 'dart:convert';

List<Movie> toDoFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String toDoToJson(List<Movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {

  String title_movie;
  String release_date;
  String rating_movie;
  String review_movie;
  bool watched_status;

  Movie({
    required this.title_movie,
    required this.release_date,
    required this.rating_movie,
    required this.review_movie,
    required this.watched_status,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title_movie: json["fields"]["title_movie"],
    release_date: json["fields"]["release_date"],
    rating_movie: json["fields"]["rating_movie"],
    review_movie: json["fields"]["review_movie"],
    watched_status: json["fields"]["watched_status"] == "Watched",
  );

  Map<String, dynamic> toJson() => {
    "title_movie": title_movie,
    "release_date": release_date,
    "rating_movie": rating_movie,
    "review_movie": review_movie,
    "watched_status": watched_status,
  };
}
