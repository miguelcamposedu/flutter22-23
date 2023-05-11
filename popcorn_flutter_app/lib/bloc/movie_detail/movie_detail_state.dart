part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

// Set fav
class MovieDetailSetFavInitial extends MovieDetailState {}

class MovieDetailSetFavLoading extends MovieDetailState {}

class MovieDetailSetFavSuccess extends MovieDetailState {
  final bool isFav;
  const MovieDetailSetFavSuccess(this.isFav);
}

class MovieDetailSetFavError extends MovieDetailState {}

// Add/delete watchlist
class MovieDetailAddWatchlistInitial extends MovieDetailState {}

class MovieDetailAddWatchlistLoading extends MovieDetailState {}

class MovieDetailAddWatchlistSuccess extends MovieDetailState {}

class MovieDetailAddWatchlistError extends MovieDetailState {}
