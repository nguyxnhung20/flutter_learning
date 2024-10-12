import 'package:flutter_learning/lesson_25_retrofit/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_learning/lesson_25_retrofit/domain/entities/movie.dart';
import 'package:flutter_learning/lesson_25_retrofit/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getMovies() async {
    final response = await remoteDataSource.getNowPlayingMoviesResponse();
    return response.results;
  }
}
