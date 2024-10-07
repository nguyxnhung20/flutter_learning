import 'dart:convert';
import 'package:flutter_learning/lesson_24/core/utils/dot_env_util.dart';
import 'package:flutter_learning/lesson_24/data/models/movie_modal.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getMovies() async {
    var headers = {
      'Authorization': 'Bearer ${DotEnvUtil.apiKey}',
      'Accept': 'application/json'
    };
    // Cách 1:
    // var url = Uri.parse(
    //     'https://api.themoviedb.org/3/movie/now_playing?language=vi-VN&page=1');

    // Cách 2:
    var queryParameters = {
      'language': 'vi-VN',
      'page': '1',
    };
    final url = Uri.https(
      DotEnvUtil.hostApi,
      '${DotEnvUtil.apiVesion}/movie/now_playing',
      queryParameters,
    );
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> moviesJson = json.decode(response.body)['results'];
      //! Sử dụng Model trong DataSource
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
