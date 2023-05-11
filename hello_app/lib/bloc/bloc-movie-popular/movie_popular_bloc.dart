import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_app/model/movie_popular.dart';
import 'package:hello_app/model/tmdb_error.dart';
import 'package:hello_app/service/movie_service.dart';
part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  late MovieService movieService;
  MoviePopularBloc() : super(MoviePopularInitial()) {
    movieService = MovieService();
    on<MoviePopularFetchAll>(_onMoviePopularFetchAll);
  }

  Future<void> _onMoviePopularFetchAll(
      MoviePopularFetchAll event, Emitter<MoviePopularState> emit) async {
    var response = await movieService.getPopularMovies();
    emit(MoviePopularLoaded(movies: response.results));
  }
}
