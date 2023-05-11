import 'package:hello_app/model/movie_popular.dart';
import 'package:hello_app/repository/movie_repository.dart';

class MovieService {
  late MovieRepository movieRepository;

  MovieService() {
    movieRepository = MovieRepository();
  }

  Future<MoviePopularResponse> getPopularMovies() {
    return movieRepository.getAllMovies();
  }
}
