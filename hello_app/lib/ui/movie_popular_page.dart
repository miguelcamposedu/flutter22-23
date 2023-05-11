import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_app/bloc/bloc-movie-popular/movie_popular_bloc.dart';
import 'package:hello_app/model/movie_popular.dart';

class MoviePopularPage extends StatefulWidget {
  const MoviePopularPage({super.key});

  @override
  State<MoviePopularPage> createState() => _MoviePopularPageState();
}

class _MoviePopularPageState extends State<MoviePopularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2D2F41),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Movies'),
        ),
        body: MoviePopularList());
  }

  MoviePopularList() {
    List<Movie>? movies = [];

    return BlocProvider<MoviePopularBloc>(
      create: (context) => MoviePopularBloc(),
      child: BlocBuilder<MoviePopularBloc, MoviePopularState>(
        builder: (context, state) {
          final _moviePopularBloc = BlocProvider.of<MoviePopularBloc>(context);

          if (state is MoviePopularLoaded) {
            movies.addAll(state.movies);
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Cards(book: books[index]);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
