import 'package:popcorn_flutter_app/model/movies_response.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchMovies(String type);
}
