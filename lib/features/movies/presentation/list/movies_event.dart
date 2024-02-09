part of 'movies_bloc.dart';

abstract class MoviesEvent {}

class UpdateSearchQueryEvent extends MoviesEvent {
  final String query;

  UpdateSearchQueryEvent(this.query);
}

class GetMoviesPageDataEvent extends MoviesEvent {
  final bool shouldSyncData;

  GetMoviesPageDataEvent({
    this.shouldSyncData = false,
  });
}

class GetNowPlayingMoviesEvent extends MoviesEvent {
  GetNowPlayingMoviesEvent();
}

class GetMovieGenresAndMoviesByGenreIdEvent extends MoviesEvent {
  final bool shouldSyncData;
  GetMovieGenresAndMoviesByGenreIdEvent({
    required this.shouldSyncData,
  });
}

class GetMoviesByGenreIdEvent extends MoviesEvent {
  final int genreId;
  final bool shouldSyncData;

  GetMoviesByGenreIdEvent({
    required this.genreId,
    required this.shouldSyncData,
  });
}
