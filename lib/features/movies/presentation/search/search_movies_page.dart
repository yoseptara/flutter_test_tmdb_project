import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test_tmdb_project/core/components/shimmer_widget.dart';
import 'package:flutter_test_tmdb_project/core/utils/enums.dart';
import 'package:flutter_test_tmdb_project/environment.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/repositories/movie_repository.dart';
import 'package:flutter_test_tmdb_project/features/movies/domain/use_cases/movies_use_cases.dart';
import 'package:flutter_test_tmdb_project/features/movies/presentation/search/search_movies_cubit.dart';
import 'package:intl/intl.dart';

class SearchMoviesPage extends StatelessWidget {
  const SearchMoviesPage({
    super.key,
    required this.genreIds,
    this.initSearchQuery = '',
  });

  final List<int> genreIds;
  final String initSearchQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => SearchMoviesCubit(
          movieUseCases: MovieUseCases(
            movieRepository: context.read<MovieRepository>(),
          ),
          initSearchQuery: initSearchQuery,
        )..getAllMoviesLocalData(genreIds),
        child: _View(
          initSearchQuery: initSearchQuery,
        ),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View({
    super.key,
    required this.initSearchQuery,
  });

  final String initSearchQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 19,
        ),
        TextFormField(
          initialValue: initSearchQuery,
          onChanged: context.read<SearchMoviesCubit>().updateSearchQuery,
          style: TextStyle(
            fontSize: 13,
            decoration: TextDecoration.none,
            decorationThickness: 0,
          ),
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              size: 24,
              color: Colors.grey.shade400,
            ),
            prefixIconColor: Colors.grey.shade400,
            hintText: 'Search movies...',
            hintStyle: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade400,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
        SizedBox(
          height: 19,
        ),
        Expanded(
          child: _Movies(),
        ),
      ],
    );
  }
}

class _Movies extends StatelessWidget {
  const _Movies({
    super.key,
  });

  Widget _moviesShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerWidget(),
          Expanded(
            child: MasonryGridView.count(
              // padding: const EdgeInsets.symmetric(horizontal: 15),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              itemCount: 4,
              itemBuilder: (BuildContext context, int i) {
                final posterWidth = (MediaQuery.of(context).size.width - 45) / 2;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget(
                      customChild: Container(
                        clipBehavior: Clip.hardEdge,
                        width: posterWidth,
                        height: posterWidth,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const ShimmerWidget(
                      width: 100,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const ShimmerWidget(
                      width: 100,
                    ),
                  ],
                );
              },
              // staggeredTileBuilder: (int index) => const StaggeredGridTile.extent(2),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyMovies() {
    return const Center(
      child: Text(
        'THERE IS NO MOVIES ON THIS GENRE',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _errorMovies() {
    return const Center(
      child: Text(
        'FAILED TO FETCH MOVIES ON THIS GENRE',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _movies(List<MovieModel> movies) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Movies By Genre',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: MasonryGridView.count(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int i) {
                final posterWidth = (MediaQuery.of(context).size.width - 45) / 2;
                final thisMovie = movies[i];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: posterWidth,
                      height: posterWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        child: Image.network(
                          Env.tmdbBaseImageUrl + thisMovie.posterPath!,
                          cacheWidth: 500,
                          filterQuality: FilterQuality.low,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Icon(
                              EvaIcons.imageOutline,
                              size: posterWidth,
                              color: Colors.grey.shade400,
                              // width: _posterWidth,
                            );
                          },
                          // fit: BoxFit.cover,
                          width: posterWidth,
                          // height: 150,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      thisMovie.title ?? 'No Title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    thisMovie.releaseDate != null
                        ? Text(
                            DateFormat.yMMMd().format(thisMovie.releaseDate!),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff8B8B8B),
                            ),
                          )
                        : const Text(
                            'Soon',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff8B8B8B),
                            ),
                          ),
                  ],
                );
              },
              // staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
      buildWhen: (previous, current) =>
          previous.getAllMoviesLocalDataState != current.getAllMoviesLocalDataState ||
          previous.allMovies != current.allMovies ||
          previous.searchQuery != current.searchQuery,
      builder: (context, state) {
        if (state.getAllMoviesLocalDataState == RequestState.loading) {
          return _moviesShimmer();
        }

        if (state.getAllMoviesLocalDataState == RequestState.failure) {
          return _errorMovies();
        }

        final movies = state.searchQuery.isEmpty
            ? state.allMovies
            : state.allMovies
                .where(
                  (element) =>
                      element.title != null &&
                      element.title!.trim().toLowerCase().contains(
                            state.searchQuery.trim().toLowerCase(),
                          ),
                )
                .toList();

        if (movies.isEmpty) {
          return _emptyMovies();
        }

        return _movies(movies);
      },
    );
  }
}
