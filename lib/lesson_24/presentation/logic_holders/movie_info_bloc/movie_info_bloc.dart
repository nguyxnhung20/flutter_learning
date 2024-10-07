import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/lesson_24/domain/entities/movie.dart';
import 'package:flutter_learning/lesson_24/domain/usecases/movie_usecase.dart';

part 'movie_info_event.dart';
part 'movie_info_state.dart';

class MovieInfoBloc extends Bloc<MoviesEvent, MoviesState> {
  GetMovies getMovies;
  MovieInfoBloc(
    this.getMovies,
  ) : super(MoviesInitial()) {
    on<LoadMovies>(_onLoadMovies);
  }

  Future<void> _onLoadMovies(
      LoadMovies event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    try {
      final movies = await getMovies();
      emit(MoviesLoaded(movies));
    } catch (error) {
      emit(MoviesError(error.toString()));
    }
  }
}
