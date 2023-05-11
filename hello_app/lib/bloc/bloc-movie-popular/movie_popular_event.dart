part of 'movie_popular_bloc.dart';

@immutable
abstract class MoviePopularEvent {}

class MoviePopularFetch extends MoviePopularEvent {
  final int page;

  MoviePopularFetch({required this.page});
}

class MoviePopularFetchAll extends MoviePopularEvent {}
