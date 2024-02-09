part of 'search_movies_cubit.dart';

class SearchMoviesState {
  final RequestState getAllMoviesLocalDataState;
  final String searchQuery;
  final List<MovieModel> allMovies;

  SearchMoviesState({
    this.getAllMoviesLocalDataState = RequestState.loading,
    this.searchQuery = '',
    this.allMovies = const [],
  });

  SearchMoviesState update({
    RequestState? getAllMoviesLocalDataState,
    String? searchQuery,
    List<MovieModel>? allMovies,
  }) {
    return SearchMoviesState(
      getAllMoviesLocalDataState: getAllMoviesLocalDataState ?? this.getAllMoviesLocalDataState,
      searchQuery: searchQuery ?? this.searchQuery,
      allMovies: allMovies ?? this.allMovies,
    );
  }
}
