
import 'package:flutter_test_tmdb_project/core/utils/custom_serialization_function.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  @HiveType(typeId: 1)
  const factory MovieModel({
    @HiveField(0)
    String? title,
    @HiveField(1)
    double? popularity,
    @HiveField(2)
    @JsonKey(name: 'vote_average')
    double? voteAverage,
    @HiveField(3)
    @JsonKey(name: 'vote_count')
    double? voteCount,
    @HiveField(4)
    @JsonKey(name: 'poster_path')
    String? posterPath,
    @HiveField(5)
    @JsonKey(name: 'backdrop_path')
    String? backdropPath,
    @HiveField(6)
    @JsonKey(name: 'release_date')
    @HiveField(7)
    @DateTimeFromJsonConverter()
    DateTime? releaseDate,
    @HiveField(8)
    @JsonKey(name: 'genre_ids')
    @Default([]) List<int> genreIds,
}) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
 // Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}