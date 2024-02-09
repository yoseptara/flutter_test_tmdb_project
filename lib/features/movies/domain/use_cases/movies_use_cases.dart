import 'package:flutter_test_tmdb_project/features/movies/data/models/genre_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/repositories/movie_repository.dart';

class MovieUseCases {
  final MovieRepository movieRepository;

  MovieUseCases({
    required this.movieRepository,
  });

  Future<List<MovieModel>> getNowPlayingMovies() async {
    return await movieRepository.fetchNowPlayingMovies();
  }

  Future<List<GenreModel>> getMovieGenres() async {
    return await movieRepository.fetchMovieGenres();
  }

  Future<List<MovieModel>> getAndRefreshCacheMoviesByGenreId(int genreId) async {
    return await movieRepository.fetchAndRefreshCacheMoviesByGenre(genreId: genreId);
  }

  Future< List<MovieModel>> getMoviesByGenreId(int genreId) async {
      return await movieRepository.fetchMoviesByGenre(genreId: genreId);
  }
}
