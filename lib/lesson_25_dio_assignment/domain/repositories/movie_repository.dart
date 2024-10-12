import 'package:flutter_learning/lesson_25_dio_assignment/domain/entities/genre.dart';
import 'package:flutter_learning/lesson_25_dio_assignment/domain/entities/image_configuration.dart';
import 'package:flutter_learning/lesson_25_dio_assignment/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Genre>?> getGenre();
  Future<ImageConfigInfo?> getImageInfo();
  Future<List<Movie>?> getMovies();
}
