// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_learning/lesson_25_retrofit/data/models/movie_model.dart';
import 'package:json_annotation/json_annotation.dart';

//! part để liên kết file giữa file khai báo và file generation
part 'now_playing_movies_response.g.dart';

@JsonSerializable()
class NowPlayingMoviesResponse {
  @JsonKey(name: "results")
  final List<MovieModel> results;
  NowPlayingMoviesResponse({
    required this.results,
  });

  factory NowPlayingMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingMoviesResponseFromJson(json);
}
