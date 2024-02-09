import 'package:dartz/dartz.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';

abstract class MoviesLocalDataSource {
  Future<bool> isLocalMoviesByGenreIdDataExist(int genreId);
  Future<void> storeAllMoviesByGenreId(
      {required int genreId, required List<MovieModel> movies,});
  Future<List<MovieModel>> getAllLocalDataMovies(List<int> genreIds);
  Future<List<MovieModel>> getAllMoviesByGenreId(int genreId);
  // Future<Unit> addMovie(MovieModel task);
  // Future<Unit> deleteMovie(String title);
  Future<Unit> deleteAllMoviesByGenreId(int genreId);
}
