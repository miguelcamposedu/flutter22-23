part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class FetchMovieWithType extends MoviesEvent {
  final String type;
  FetchMovieWithType(this.type);
}
