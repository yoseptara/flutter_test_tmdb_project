import 'package:dartz/dartz.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/data_sources/local/movies_local_data_source.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';
import 'package:hive/hive.dart';

class MoviesLocalDataSourceHive implements MoviesLocalDataSource {
  final _kMovieBox = 'movies_box';

  String generateMoviesByGenreKeys(int genreId) {
    return '$_kMovieBox-$genreId';
  }

  Future<bool> _initDbByGenreId(int genreId) async {

    if (Hive.isBoxOpen(generateMoviesByGenreKeys(genreId)) == false) {
      await Hive.openBox<MovieModel>(generateMoviesByGenreKeys(genreId));
    }
    return true;
  }

  @override
  Future<bool> isLocalMoviesByGenreIdDataExist(int genreId) async {
    return await Hive.boxExists(generateMoviesByGenreKeys(genreId));
  }

  @override
  Future<void> storeAllMoviesByGenreId({
    required int genreId,
    required List<MovieModel> movies,
  }) async {
    await _initDbByGenreId(genreId);
    final moviesBox = Hive.box<MovieModel>(generateMoviesByGenreKeys(genreId));
    await moviesBox.addAll(movies);
  }

  @override
  Future<List<MovieModel>> getAllMoviesByGenreId(int genreId) async {
    await _initDbByGenreId(genreId);
    final moviesBox = Hive.box<MovieModel>(generateMoviesByGenreKeys(genreId));
    final result = moviesBox.values
        .map<MovieModel>((e) => e)
        .where((element) => element.genreIds.contains(genreId))
        .toList();
    return result;
  }

  @override
  Future<List<MovieModel>> getAllLocalDataMovies(List<int> genreIds) async {
    final List<Future<List<MovieModel>>> listFutures = [];
    for (int id in genreIds) {
      listFutures.add(getAllMoviesByGenreId(id));
    }

    return await Future.wait(listFutures)
        .then((value) => value.expand((element) => element).toList());
  }

  @override
  Future<Unit> deleteAllMoviesByGenreId(int genreId) async {
    await _initDbByGenreId(genreId);
    final moviesBox = Hive.box<MovieModel>(generateMoviesByGenreKeys(genreId));
    await moviesBox.clear();
    return Future.value(unit);
  }
}
