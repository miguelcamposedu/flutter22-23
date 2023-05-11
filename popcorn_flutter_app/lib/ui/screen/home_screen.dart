import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_flutter_app/bloc/movies/movies_bloc.dart';
import 'package:popcorn_flutter_app/model/movies_response.dart';
import 'package:popcorn_flutter_app/repository/movie_repository.dart';
import 'package:popcorn_flutter_app/repository/movie_repository_impl.dart';
import 'package:popcorn_flutter_app/ui/screen/error_screen.dart';
import 'package:popcorn_flutter_app/utils/constants.dart' as constants;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieRepository movieRepository;
  late MoviesBloc blocPopular;
  late MoviesBloc blocTopRated;
  late MoviesBloc blocUpcoming;

  @override
  void initState() {
    super.initState();
    movieRepository = MovieRepositoryImpl();
    blocPopular = MoviesBloc(movieRepository);
    blocTopRated = MoviesBloc(movieRepository);
    blocUpcoming = MoviesBloc(movieRepository);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (BuildContext context) =>
              blocPopular..add(FetchMovieWithType(constants.popular)),
        ),
        BlocProvider<MoviesBloc>(
          create: (BuildContext context) =>
              blocTopRated..add(FetchMovieWithType(constants.topRated)),
        ),
        BlocProvider<MoviesBloc>(
          create: (BuildContext context) =>
              blocUpcoming..add(FetchMovieWithType(constants.upcoming)),
        ),
      ],
      child: Scaffold(body: _createHome(context)),
    );
  }

  Widget _createHome(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          _blocPopular(context),
          _blocTopRated(context),
          _blocUpcoming(context),
        ],
      ),
    );
  }

  Widget _createMovieListView(
      BuildContext context, List<Movie> movies, String title) {
    final contentHeight = 4.0 * (MediaQuery.of(context).size.width / 2.4) / 3;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20.0, right: 16.0),
          height: 48.0,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward, color: Colors.red),
            ],
          ),
        ),
        SizedBox(
          height: contentHeight,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _createMovieViewItem(context, movies[index]);
            },
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
              width: 6.0,
            ),
            itemCount: movies.length,
          ),
        ),
      ],
    );
  }

  Widget _createMovieViewItem(BuildContext context, Movie movie) {
    final width = MediaQuery.of(context).size.width / 2.6;

    return Container(
      width: width,
      height: double.infinity,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 10.0,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          width: width,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              width: width,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  _blocPopular(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      bloc: blocPopular,
      buildWhen: (previous, current) {
        if (current is MoviesFetched && current.type == constants.popular) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is MoviesInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieFetchError) {
          return ErrorScreen(
            message: state.message,
            retry: () {
              context
                  .watch<MoviesBloc>()
                  .add(FetchMovieWithType(constants.popular));
            },
          );
        } else if (state is MoviesFetched && state.type == constants.popular) {
          return _createMovieListView(context, state.movies, 'Popular');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _blocTopRated(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      bloc: blocTopRated,
      buildWhen: (previous, current) {
        if (current is MoviesFetched && current.type == constants.topRated) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is MoviesInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieFetchError) {
          return ErrorScreen(
            message: state.message,
            retry: () {
              context
                  .watch<MoviesBloc>()
                  .add(FetchMovieWithType(constants.topRated));
            },
          );
        } else if (state is MoviesFetched && state.type == constants.topRated) {
          return _createMovieListView(context, state.movies, 'TopRated');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _blocUpcoming(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      bloc: blocUpcoming,
      buildWhen: (previous, current) {
        if (current is MoviesFetched && current.type == constants.upcoming) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is MoviesInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieFetchError) {
          return ErrorScreen(
            message: state.message,
            retry: () {
              context
                  .watch<MoviesBloc>()
                  .add(FetchMovieWithType(constants.upcoming));
            },
          );
        } else if (state is MoviesFetched && state.type == constants.upcoming) {
          return _createMovieListView(context, state.movies, 'Upcoming');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
