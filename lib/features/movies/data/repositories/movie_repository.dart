import 'package:flutter/material.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/data_sources/local/hive/movies_local_data_source_hive.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/data_sources/remote/movies_remote_data_source.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/genre_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';

class MovieRepository {
  final MoviesLocalDataSourceHive localHiveDataSource;
  final MoviesRemoteDataSource remoteDataSource;

  const MovieRepository({
    required this.localHiveDataSource,
    required this.remoteDataSource,
  });

  Future<List<MovieModel>> fetchNowPlayingMovies() async {
    return await remoteDataSource.fetchNowPlayingMovies();
  }

  Future<List<GenreModel>> fetchMovieGenres() async {
    return await remoteDataSource.fetchMovieGenres();
  }


  Future<List<MovieModel>> fetchAllLocalDataMovies(List<int> genreIds) async {
    return await localHiveDataSource.getAllLocalDataMovies(genreIds);
  }

  Future<List<MovieModel>> fetchAndRefreshCacheMoviesByGenre({
    required int genreId,
  }) async {
    List<MovieModel> result = [];

    await Future.wait([
      localHiveDataSource.deleteAllMoviesByGenreId(genreId),
      remoteDataSource.fetchMoviesByGenre(genreId: genreId).then(
            (value) => result = value,
          ),
    ]);
    debugPrint(
        '(MovieRepository, fetchAndRefreshCacheMoviesByGenre) cek fetchMoviesByGenre result : $result');
    await localHiveDataSource.storeAllMoviesByGenreId(genreId: genreId, movies: result);

    return result;
  }

  Future<List<MovieModel>> fetchMoviesByGenre({
    required int genreId,
  }) async {
    final isLocalDataExist =
        await localHiveDataSource.isLocalMoviesByGenreIdDataExist(genreId);
    if (isLocalDataExist) {
      return await localHiveDataSource.getAllMoviesByGenreId(genreId);
    }

    return fetchAndRefreshCacheMoviesByGenre(genreId: genreId);
  }
}
