import 'package:flutter_learning/lesson_25_retrofit/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
}
