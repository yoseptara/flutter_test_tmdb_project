import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_tmdb_project/core/components/shimmer_widget.dart';
import 'package:flutter_test_tmdb_project/core/utils/enums.dart';
import 'package:flutter_test_tmdb_project/environment.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/repositories/movie_repository.dart';
import 'package:flutter_test_tmdb_project/features/movies/domain/use_cases/movies_use_cases.dart';
import 'package:flutter_test_tmdb_project/features/movies/presentation/movies_bloc.dart';

class MoviesPage extends StatelessWidget {
  static const route = '/movies_page';

  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'The Movie List',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => MoviesBloc(
          MovieUseCases(
            movieRepository: context.read<MovieRepository>(),
          ),
        )..add(
            GetMoviesPageDataEvent(),
          ),
        child: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(
          height: 19,
        ),
        _NowPlayingMoviesBanner(),
        SizedBox(
          height: 16,
        ),
        _Genres(),
        SizedBox(
          height: 16,
        ),
        _MoviesByGenre()
      ],
    );
  }
}

class _NowPlayingMoviesBanner extends StatelessWidget {
  const _NowPlayingMoviesBanner({Key? key}) : super(key: key);

  Widget _nowPlayingMoviesBannerShimmer() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(
            height: 20,
            width: 150,
          ),
          SizedBox(
            height: 15,
          ),
          ShimmerWidget(
            width: double.maxFinite,
            height: 130,
          ),
          SizedBox(
            height: 15,
          ),
          ShimmerWidget(
            height: 15,
            width: 100,
          )
        ],
      ),
    );
  }

  Widget _emptyNowPlayingMoviesBuilder() {
    return const Center(
      child: Text(
        'EMPTY NOW PLAYING MOVIES',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _nowPlayingMoviesBuilder(BuildContext context, MoviesState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Now Playing Movies',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Swiper(
            autoplay: state.nowPlayingMovies.length > 1 ? true : false,
            outer: true,
            itemBuilder: (BuildContext context, int i) {
              // if(i + 1 < state.nowPlayingMovies.length) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: state.nowPlayingMovies[i].backdropPath == null
                        ? const Text(
                            'NO IMAGE',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        : Image.network(
                            Env.tmdbBaseImageUrl + state.nowPlayingMovies[i].backdropPath!,
                            cacheWidth: 500,
                            // filterQuality: FilterQuality.low,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const ShimmerWidget(
                                height: 130,
                                width: double.maxFinite,
                              );
                            },
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                            // height: 150,
                          ),
                  ),
                ),
              );
              // }
              // return Container(
              //   clipBehavior: Clip.hardEdge,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Center(
              //     child: state.nowPlayingMovies[i].posterPath == null
              //         ? const Text(
              //             'NO IMAGE',
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //           )
              //         : Image.network(
              //             Env.tmdbBaseImageUrl + state.nowPlayingMovies[i].posterPath!,
              //             cacheWidth: 500,
              //             // filterQuality: FilterQuality.low,
              //             loadingBuilder: (BuildContext context, Widget child,
              //                 ImageChunkEvent? loadingProgress) {
              //               if (loadingProgress == null) return child;
              //               return const ShimmerWidget(
              //                 height: 130,
              //                 width: double.maxFinite,
              //               );
              //             },
              //             fit: BoxFit.cover,
              //             width: double.infinity,
              //             // height: 150,
              //           ),
              //   ),
              // );
            },
            itemCount: state.nowPlayingMovies.length,
            viewportFraction: 0.9,
            physics: state.nowPlayingMovies.length != 1
                ? const ClampingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            scale: 1,
            pagination: state.nowPlayingMovies.length != 1
                ? const SwiperPagination(
                    alignment: Alignment.bottomLeft,
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.black,
                      color: Color(0xffBBBBBB),
                      size: 8,
                      activeSize: 10,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.getNowPlayingMoviesState != current.getNowPlayingMoviesState ||
          previous.nowPlayingMovies != current.nowPlayingMovies,
      builder: (context, state) {
        if (state.getNowPlayingMoviesState == RequestState.loading) {
          return _nowPlayingMoviesBannerShimmer();
        } else if (state.nowPlayingMovies.isEmpty) {
          return _emptyNowPlayingMoviesBuilder();
        } else {
          return _nowPlayingMoviesBuilder(context, state);
        }
      },
    );
  }
}

class _Genres extends StatelessWidget {
  const _Genres({Key? key}) : super(key: key);

  Widget _genresShimmer() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerWidget(),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              children: List<Widget>.generate(
                5,
                (index) => Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color(0xffEBEBEB),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyGenresBuilder() {
    return const Center(
      child: Text(
        'EMPTY GENRES',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _genresBuilder(MoviesState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Genre List',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 72,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final bool isSelected = state.movieGenres[i].id == state.selectedGenreId;
              return InkResponse(
                onTap: () {
                  context.read<MoviesBloc>().add(
                        GetMoviesByGenreIdEvent(
                          shouldSyncData: false,
                         genreId:  state.movieGenres[i].id,
                        ),
                      );
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: isSelected ? Colors.black : const Color(0xffEBEBEB),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      state.movieGenres[i].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 10, color: isSelected ? Colors.black : null),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, i) => const SizedBox(
              width: 15,
            ),
            itemCount: state.movieGenres.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.getMovieGenresState != current.getMovieGenresState ||
          previous.movieGenres != current.movieGenres ||
          previous.selectedGenreId != current.selectedGenreId,
      builder: (context, state) {
        if (state.getMovieGenresState == RequestState.loading) {
          return _genresShimmer();
        } else if (state.movieGenres.isEmpty) {
          return _emptyGenresBuilder();
        } else {
          return _genresBuilder(state);
        }
      },
    );
  }
}

class _MoviesByGenre extends StatelessWidget {
  const _MoviesByGenre({Key? key}) : super(key: key);

  Widget _moviesByGenreShimmer() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(),
          SizedBox(
            height: 21,
          ),
          // StaggeredGrid.countBuilder(
          //   // padding: const EdgeInsets.symmetric(horizontal: 15),
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   scrollDirection: Axis.vertical,
          //   crossAxisCount: 4,
          //   itemCount: 4,
          //   itemBuilder: (BuildContext context, int i) {
          //     final posterWidth = (MediaQuery.of(context).size.width - 45) / 2;
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         ShimmerWidget(
          //           customChild: Container(
          //             clipBehavior: Clip.hardEdge,
          //             width: posterWidth,
          //             height: posterWidth,
          //             decoration: BoxDecoration(
          //               color: Colors.grey,
          //               borderRadius: BorderRadius.circular(8),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 12,
          //         ),
          //         const ShimmerWidget(
          //           width: 100,
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         const ShimmerWidget(
          //           width: 100,
          //         ),
          //       ],
          //     );
          //   },
          //   staggeredTileBuilder: (int index) => const StaggeredGridTile.extent(2),
          //   mainAxisSpacing: 15,
          //   crossAxisSpacing: 15,
          // ),
        ],
      ),
    );
  }

  Widget _emptyMoviesByGenreBuilder() {
    return const Center(
      child: Text(
        'THERE IS NO MOVIES ON THIS GENRE',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _moviesByGenreBuilder(MoviesState state) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Movies By Genre',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 21,
          ),
          // StaggeredGridView.countBuilder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   scrollDirection: Axis.vertical,
          //   crossAxisCount: 4,
          //   itemCount: state.moviesByGenre.length,
          //   itemBuilder: (BuildContext context, int i) {
          //     final posterWidth = (MediaQuery.of(context).size.width - 45) / 2;
          //     final thisMovie = state.moviesByGenre[i];
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           clipBehavior: Clip.hardEdge,
          //           width: posterWidth,
          //           height: posterWidth,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //           child: FittedBox(
          //             fit: BoxFit.cover,
          //             alignment: Alignment.topCenter,
          //             child: Image.network(
          //               Env.tmdbBaseImageUrl + thisMovie.posterPath!,
          //               cacheWidth: 500,
          //               filterQuality: FilterQuality.low,
          //               loadingBuilder: (BuildContext context, Widget child,
          //                   ImageChunkEvent? loadingProgress) {
          //                 if (loadingProgress == null) return child;
          //                 return Icon(
          //                   EvaIcons.imageOutline,
          //                   size: posterWidth,
          //                   color: Colors.grey.shade400,
          //                   // width: _posterWidth,
          //                 );
          //               },
          //               // fit: BoxFit.cover,
          //               width: posterWidth,
          //               // height: 150,
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 12,
          //         ),
          //         Text(
          //           thisMovie.title ?? 'No Title',
          //           maxLines: 1,
          //           overflow: TextOverflow.ellipsis,
          //           style: const TextStyle(
          //             fontSize: 14,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         thisMovie.releaseDate != null
          //             ? Text(
          //                 DateFormat.yMMMd().format(thisMovie.releaseDate!),
          //                 style: const TextStyle(
          //                   fontSize: 12,
          //                   color: Color(0xff8B8B8B),
          //                 ),
          //               )
          //             : const Text(
          //           'Soon',
          //           style: TextStyle(
          //             fontSize: 12,
          //             color: Color(0xff8B8B8B),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          //   staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
          //   mainAxisSpacing: 15,
          //   crossAxisSpacing: 15,
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.getMovieGenresState != current.getMovieGenresState ||
          previous.getMoviesByGenreState != current.getMoviesByGenreState ||
          previous.moviesByGenre != current.moviesByGenre,
      builder: (context, state) {
        if (state.getMovieGenresState  == RequestState.loading|| state.getMoviesByGenreState == RequestState.loading) {
          return _moviesByGenreShimmer();
        } else if (state.moviesByGenre.isEmpty) {
          return _emptyMoviesByGenreBuilder();
        } else {
          return _moviesByGenreBuilder(state);
        }
      },
    );
  }
}
