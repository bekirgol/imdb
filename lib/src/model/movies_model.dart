// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

MoviesModel moviesModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));

String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel {
  MoviesModel({
    this.success,
    this.result,
  });

  bool? success;
  List<Result>? result;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        success: json["success"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  String? title;
  String? year;
  String? imdbId;
  Type? type;
  String? poster;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map![json["Type"]],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse![type],
        "Poster": poster,
      };
}

enum Type { MOVIE, GAME }

final typeValues = EnumValues({"game": Type.GAME, "movie": Type.MOVIE});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
