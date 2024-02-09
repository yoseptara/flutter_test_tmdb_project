import 'package:dio/dio.dart';
import 'package:flutter_test_tmdb_project/core/services/api_service.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/genre_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';

class MoviesRemoteDataSource {
  final ApiService apiService;

  const MoviesRemoteDataSource(this.apiService);

  Future<List<MovieModel>> fetchNowPlayingMovies() async {
    final Response response =
        await apiService.use(urlParams: 'movie/now_playing', action: DioAction.get);
    final data = response.data?['results'] ?? [];
    return (data as List)
        .map(
          (e) => MovieModel.fromJson(e),
        )
        .toList();
    // }
  }

  Future<List<GenreModel>> fetchMovieGenres() async {
    final Response response = await apiService.use(
      urlParams: 'genre/movie/list',
      action: DioAction.get,
    );
    final data = response.data?['genres'] ?? [];
    return (data as List)
        .map(
          (e) => GenreModel.fromJson(e),
        )
        .toList();
    // }
  }

  Future<List<MovieModel>> fetchMoviesByGenre({
    required int genreId,
  }) async {
    final Response response = await apiService.use(
      urlParams: 'discover/movie',
      urlAdditionalParams: 'with_genres=$genreId',
      action: DioAction.get,
    );
    final data = response.data?['results'] ?? [];
    return (data as List)
        .map(
          (e) => MovieModel.fromJson(e),
        )
        .toList();
    // }
  }
}
