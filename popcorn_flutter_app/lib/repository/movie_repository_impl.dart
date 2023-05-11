import 'dart:convert';

import 'package:http/http.dart';
import 'package:popcorn_flutter_app/model/movies_response.dart';
import 'package:popcorn_flutter_app/repository/movie_repository.dart';
import 'package:popcorn_flutter_app/utils/constants.dart' as constants;

class MovieRepositoryImpl extends MovieRepository {
  final Client _client = Client();

  @override
  Future<List<Movie>> fetchMovies(String type) async {
    final response = await _client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$type?api_key=${constants.apiKey}'));
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception('Fail to load movies');
    }
  }
}
