import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_tmdb_project/core/utils/enums.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/domain/use_cases/movies_use_cases.dart';

part 'search_movies_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final MovieUseCases movieUseCases;
  final String initSearchQuery;

  SearchMoviesCubit({
    required this.movieUseCases,
    required this.initSearchQuery,
  }) : super(
          SearchMoviesState(
            searchQuery: initSearchQuery,
          ),
        );

  void updateSearchQuery(String query) {
    emit(state.update(searchQuery: query));
  }

  Future<void> getAllMoviesLocalData(List<int> genreIds) async {
    try {
      emit(state.update(getAllMoviesLocalDataState: RequestState.loading));
      final res = await movieUseCases.getAllLocalDataMovies(genreIds);

      emit(
        state.update(
          getAllMoviesLocalDataState: RequestState.success,
          allMovies: res,
        ),
      );
    } catch (e) {
      emit(state.update(getAllMoviesLocalDataState: RequestState.failure));
      rethrow;
    }
  }
}
