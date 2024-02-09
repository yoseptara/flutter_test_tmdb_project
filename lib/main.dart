import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_tmdb_project/core/services/api_service.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/data_sources/local/hive/movies_local_data_source_hive.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/data_sources/remote/movies_remote_data_source.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/models/movie_model.dart';
import 'package:flutter_test_tmdb_project/features/movies/data/repositories/movie_repository.dart';
import 'package:flutter_test_tmdb_project/features/movies/presentation/list/movies_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelImplAdapter());
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({super.key, required this.apiService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => MovieRepository(
            localHiveDataSource: MoviesLocalDataSourceHive(),
            remoteDataSource: MoviesRemoteDataSource(apiService),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'TMDB',
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        initialRoute: MoviesPage.route,
        routes: {
          MoviesPage.route: (context) => const MoviesPage(),
          // CreateOrEditContactPage.route: (context) => const CreateOrEditContactPage(),
        },
      ),
    );
  }
}
