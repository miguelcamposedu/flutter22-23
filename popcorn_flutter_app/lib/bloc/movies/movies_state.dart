part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesFetched extends MoviesState {
  final List<Movie> movies;
  final String type;
  MoviesFetched(this.movies, this.type);
}

class MovieFetchError extends MoviesState {
  final String message;
  MovieFetchError(this.message);
}
