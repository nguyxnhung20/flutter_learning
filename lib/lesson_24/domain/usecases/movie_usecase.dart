//!  use case để xử lý nghiệp vụ, ở đây có nghiệp vụ lấy danh sách phim
import 'package:flutter_learning/lesson_24/domain/entities/movie.dart';
import 'package:flutter_learning/lesson_24/domain/repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}
