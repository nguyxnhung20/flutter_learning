import 'package:flutter_learning/lesson_25_retrofit/domain/entities/movie.dart';
import 'package:json_annotation/json_annotation.dart';

//! part để liên kết file giữa file khai báo và file generation
part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  // factory MovieModel.fromJson(Map<String, dynamic> json) {
  //   return MovieModel(
  //     id: json['id'],
  //     title: json['title'],
  //     overview: json['overview'],
  //   );
  // }

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'overview': overview,
  //   };
  // }
}
