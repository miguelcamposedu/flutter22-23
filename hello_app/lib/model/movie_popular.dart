class MoviePopularResponse {
  int? page;
  List<Movie>? results;
  int? totalResults;
  int? totalPages;

  MoviePopularResponse(
      {this.page, this.results, this.totalResults, this.totalPages});

  MoviePopularResponse.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Movie.fromJson(e)).toList();
    }
    if (json["total_results"] is int) {
      totalResults = json["total_results"];
    }
    if (json["total_pages"] is int) {
      totalPages = json["total_pages"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    if (results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    _data["total_results"] = totalResults;
    _data["total_pages"] = totalPages;
    return _data;
  }
}

class Movie {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  double? popularity;
  int? voteCount;
  bool? video;
  double? voteAverage;

  Movie(
      {this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage});

  Movie.fromJson(Map<String, dynamic> json) {
    if (json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if (json["adult"] is bool) {
      adult = json["adult"];
    }
    if (json["overview"] is String) {
      overview = json["overview"];
    }
    if (json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if (json["genre_ids"] is List) {
      genreIds =
          json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if (json["original_language"] is String) {
      originalLanguage = json["original_language"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    if (json["popularity"] is double) {
      popularity = json["popularity"];
    }
    if (json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
    if (json["video"] is bool) {
      video = json["video"];
    }
    if (json["vote_average"] is double) {
      voteAverage = json["vote_average"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["poster_path"] = posterPath;
    _data["adult"] = adult;
    _data["overview"] = overview;
    _data["release_date"] = releaseDate;
    if (genreIds != null) {
      _data["genre_ids"] = genreIds;
    }
    _data["id"] = id;
    _data["original_title"] = originalTitle;
    _data["original_language"] = originalLanguage;
    _data["title"] = title;
    _data["backdrop_path"] = backdropPath;
    _data["popularity"] = popularity;
    _data["vote_count"] = voteCount;
    _data["video"] = video;
    _data["vote_average"] = voteAverage;
    return _data;
  }
}
