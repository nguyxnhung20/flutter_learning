import 'package:flutter_learning/lesson_24/data/datasources/movie_remote_data_sources.dart';
import 'package:flutter_learning/lesson_24/domain/entities/movie.dart';
import 'package:flutter_learning/lesson_24/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getMovies() {
    return remoteDataSource.getMovies();
  }
}
