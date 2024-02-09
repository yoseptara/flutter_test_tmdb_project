import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_tmdb_project/core/utils/enums.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/genre_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/domain/use_cases/movies_use_cases.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieUseCases _movieUseCases;

  MoviesBloc(this._movieUseCases)
      : super(
          MoviesState(),
        ) {
    on<GetNowPlayingMoviesEvent>(
      _onGetNowPlayingMoviesEvent,
      transformer: concurrent(),
    );
    on<GetMovieGenresAndMoviesByGenreIdEvent>(
      _onGetMovieGenresAndMoviesByGenreIdEvent,
      transformer: concurrent(),
    );
    on<GetMoviesByGenreIdEvent>(
      _onGetMoviesByGenreIdEvent,
      transformer: sequential(),
    );
    on<GetMoviesPageDataEvent>(_onGetMoviesPageDataEvent);
    on<UpdateSearchQueryEvent>(_onUpdateSearchQueryEvent);
      }

      Future<void> _onUpdateSearchQueryEvent(
          UpdateSearchQueryEvent event, Emitter<MoviesState> emit,) async {
       emit(state.update(searchQuery: event.query));
  }


  Future<void> _onGetMoviesPageDataEvent(
    GetMoviesPageDataEvent event,
    Emitter<MoviesState> emit,
  ) async {
    add(
      GetNowPlayingMoviesEvent(),
    );
    add(
      GetMovieGenresAndMoviesByGenreIdEvent(
        shouldSyncData: event.shouldSyncData,
      ),
    );
  }

  Future<void> _onGetMoviesByGenreIdEvent(
    GetMoviesByGenreIdEvent event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      emit(
        state.update(
          selectedGenreId: event.genreId,
          getMoviesByGenreState: RequestState.loading,
        ),
      );

      late final List<MovieModel> results;

      if (event.shouldSyncData) {
        results = await _movieUseCases.getAndRefreshCacheMoviesByGenreId(event.genreId);
      } else {
        results = await _movieUseCases.getMoviesByGenreId(event.genreId);
      }

      emit(
        state.update(
          moviesByGenre: results,
          getMoviesByGenreState: RequestState.success,
        ),
      );
    } catch (e) {
      emit(
        state.update(
          getMoviesByGenreState: RequestState.failure,
        ),
      );
      rethrow;
    }
  }

  Future<void> _onGetMovieGenresAndMoviesByGenreIdEvent(
    GetMovieGenresAndMoviesByGenreIdEvent event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      emit(
        state.update(
          getMovieGenresState: RequestState.loading,
        ),
      );
      final List<GenreModel> results = await _movieUseCases.getMovieGenres();

      int selectedGenreId = 0;

      if (results.isNotEmpty) {
        final isGenresContainSelectedGenreId =
            results.any((e) => e.id == state.selectedGenreId);
        if (isGenresContainSelectedGenreId) {
          selectedGenreId = state.selectedGenreId!;
        }

        add(
          GetMoviesByGenreIdEvent(
            shouldSyncData: event.shouldSyncData,
            genreId: selectedGenreId,
          ),
        );
      }

      emit(
        state.update(
          selectedGenreId: selectedGenreId,
          movieGenres: results,
          getMovieGenresState: RequestState.success,
        ),
      );
    } catch (e) {
      emit(
        state.update(
          getMovieGenresState: RequestState.failure,
        ),
      );
      rethrow;
    }
  }

  Future<void> _onGetNowPlayingMoviesEvent(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      emit(
        state.update(
          getNowPlayingMoviesState: RequestState.loading,
        ),
      );
      final List<MovieModel> results = await _movieUseCases.getNowPlayingMovies();
      emit(
        state.update(
          nowPlayingMovies: results,
          getNowPlayingMoviesState: RequestState.success,
        ),
      );
    } catch (e) {
      emit(
        state.update(
          getNowPlayingMoviesState: RequestState.failure,
        ),
      );
      rethrow;
    }
  }
}
