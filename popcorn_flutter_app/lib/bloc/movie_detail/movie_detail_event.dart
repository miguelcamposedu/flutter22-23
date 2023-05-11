part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class MovieSetFavEvent extends MovieDetailEvent {
  final bool isFav;
  final String movieId;
  const MovieSetFavEvent(this.isFav, this.movieId);
}

class MovideAddWatchlistEvent extends MovieDetailEvent {
  final String movieId;
  const MovideAddWatchlistEvent(this.movieId);
}

class MovieDeleteWatchlistEvent extends MovieDetailEvent {
  final String movieId;
  const MovieDeleteWatchlistEvent(this.movieId);
}
