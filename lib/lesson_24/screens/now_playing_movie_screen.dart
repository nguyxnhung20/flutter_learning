import 'package:flutter_learning/lesson_24/data/repositories/movie_repository_impl.dart';
import 'package:flutter_learning/lesson_24/domain/usecases/movie_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/lesson_24/data/datasources/movie_remote_data_sources.dart';
import 'package:flutter_learning/lesson_24/presentation/logic_holders/movie_info_bloc/movie_info_bloc.dart';

class NowPlayingMoviesScreen extends StatelessWidget {
  const NowPlayingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Now playing movies screen"),
      ),
      body: BlocProvider<MovieInfoBloc>(
        create: (_) => MovieInfoBloc(GetMovies(MovieRepositoryImpl(
            remoteDataSource: MovieRemoteDataSourceImpl(
          client: http.Client(),
        ))))
          ..add(LoadMovies()),
        child: BlocBuilder<MovieInfoBloc, MoviesState>(builder: (_, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MoviesLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.movies[index].title));
              },
            );
          } else if (state is MoviesError) {
            return Center(child: Text(state.message));
          }
          return Container(); // Default empty container
        }),
      ),
    );
  }
}
