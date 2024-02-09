part of 'movies_bloc.dart';


class MoviesState {
  final RequestState getNowPlayingMoviesState;
  final RequestState getMovieGenresState;
  final RequestState getMoviesByGenreState;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final List<MovieModel> nowPlayingMovies;
  final List<MovieModel> moviesByGenre;
  final List<GenreModel> movieGenres;
  final int? selectedGenreId;
  final String searchQuery;

  MoviesState({
    this.getNowPlayingMoviesState = RequestState.loading,
    this.getMovieGenresState = RequestState.loading,
    this.getMoviesByGenreState = RequestState.loading,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.nowPlayingMovies = const [],
    this.moviesByGenre = const [],
    this.movieGenres = const [],
    this.selectedGenreId,
    this.searchQuery = '',
  });

  MoviesState update({
    RequestState? getNowPlayingMoviesState,
    RequestState? getMovieGenresState,
    RequestState? getMoviesByGenreState,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    List<MovieModel>? nowPlayingMovies,
    List<MovieModel>? moviesByGenre,
    List<GenreModel>? movieGenres,
    int? selectedGenreId,
    String? searchQuery,

  }) {
    return MoviesState(
      getNowPlayingMoviesState: getNowPlayingMoviesState ?? this.getNowPlayingMoviesState,
      getMovieGenresState: getMovieGenresState ?? this.getMovieGenresState,
      getMoviesByGenreState: getMoviesByGenreState ?? this.getMoviesByGenreState,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      moviesByGenre: moviesByGenre ?? this.moviesByGenre,
      movieGenres: movieGenres ?? this.movieGenres,
      selectedGenreId: selectedGenreId ?? this.selectedGenreId,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}