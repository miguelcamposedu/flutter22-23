import 'dart:convert';

import '../model/movie_popular.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  late http.Client httpClient;
  MovieRepository() {
    httpClient = http.Client();
  }

  final String apiBaseUrl = "https://api.themoviedb.org/3";

  Future<MoviePopularResponse> getAllMovies() async {
    final uri = Uri.parse(
        "$apiBaseUrl/movie/popular?api_key=433d2c486572afb242c6fe7c1ddc6771");
    final response = await httpClient.get(uri);

    return MoviePopularResponse.fromJson(jsonDecode(response.body));
  }
}
