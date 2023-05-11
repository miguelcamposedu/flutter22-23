part of 'movie_popular_bloc.dart';

@immutable
abstract class MoviePopularState {}

class MoviePopularInitial extends MoviePopularState {}

class MoviePopularLoading extends MoviePopularState {}

class MoviePopularLoaded extends MoviePopularState {
  final List<Movie>? movies;

  MoviePopularLoaded({required this.movies});
}

class MoviePopularError extends MoviePopularState {
  final TmdbErrorResponse tmdbError;

  MoviePopularError({required this.tmdbError});
}
