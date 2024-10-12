import 'package:flutter_learning/lesson_25_dio_assignment/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_learning/lesson_25_dio_assignment/domain/entities/genre.dart';
import 'package:flutter_learning/lesson_25_dio_assignment/domain/entities/image_configuration.dart';
import 'package:flutter_learning/lesson_25_dio_assignment/domain/entities/movie.dart';
import 'package:flutter_learning/lesson_25_dio_assignment/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Genre>?> getGenre() {
    return remoteDataSource.getGenre();
  }

  @override
  Future<ImageConfigInfo?> getImageInfo() {
    return remoteDataSource.getImageConfigInfo();
  }

  @override
  Future<List<Movie>?> getMovies() {
    return remoteDataSource.getMovies();
  }
}
