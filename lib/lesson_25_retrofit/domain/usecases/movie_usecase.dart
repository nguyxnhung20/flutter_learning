//! Bước 1: Tạo Entities và Use Cases
import 'package:flutter_learning/lesson_25_retrofit/domain/entities/movie.dart';
import 'package:flutter_learning/lesson_25_retrofit/domain/repositories/movie_repository.dart';

//!  use case để xử lý nghiệp vụ, ở đây có nghiệp vụ lấy danh sách phim
class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}
