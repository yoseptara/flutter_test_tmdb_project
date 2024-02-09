// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return _MovieModel.fromJson(json);
}

/// @nodoc
mixin _$MovieModel {
  @HiveField(0)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(1)
  double? get popularity => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'vote_count')
  double? get voteCount => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'release_date')
  @HiveField(7)
  @DateTimeFromJsonConverter()
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieModelCopyWith<MovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieModelCopyWith<$Res> {
  factory $MovieModelCopyWith(
          MovieModel value, $Res Function(MovieModel) then) =
      _$MovieModelCopyWithImpl<$Res, MovieModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? title,
      @HiveField(1) double? popularity,
      @HiveField(2) @JsonKey(name: 'vote_average') double? voteAverage,
      @HiveField(3) @JsonKey(name: 'vote_count') double? voteCount,
      @HiveField(4) @JsonKey(name: 'poster_path') String? posterPath,
      @HiveField(5) @JsonKey(name: 'backdrop_path') String? backdropPath,
      @HiveField(6)
      @JsonKey(name: 'release_date')
      @HiveField(7)
      @DateTimeFromJsonConverter()
      DateTime? releaseDate,
      @HiveField(8) @JsonKey(name: 'genre_ids') List<int> genreIds});
}

/// @nodoc
class _$MovieModelCopyWithImpl<$Res, $Val extends MovieModel>
    implements $MovieModelCopyWith<$Res> {
  _$MovieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? popularity = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? releaseDate = freezed,
    Object? genreIds = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      genreIds: null == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieModelImplCopyWith<$Res>
    implements $MovieModelCopyWith<$Res> {
  factory _$$MovieModelImplCopyWith(
          _$MovieModelImpl value, $Res Function(_$MovieModelImpl) then) =
      __$$MovieModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? title,
      @HiveField(1) double? popularity,
      @HiveField(2) @JsonKey(name: 'vote_average') double? voteAverage,
      @HiveField(3) @JsonKey(name: 'vote_count') double? voteCount,
      @HiveField(4) @JsonKey(name: 'poster_path') String? posterPath,
      @HiveField(5) @JsonKey(name: 'backdrop_path') String? backdropPath,
      @HiveField(6)
      @JsonKey(name: 'release_date')
      @HiveField(7)
      @DateTimeFromJsonConverter()
      DateTime? releaseDate,
      @HiveField(8) @JsonKey(name: 'genre_ids') List<int> genreIds});
}

/// @nodoc
class __$$MovieModelImplCopyWithImpl<$Res>
    extends _$MovieModelCopyWithImpl<$Res, _$MovieModelImpl>
    implements _$$MovieModelImplCopyWith<$Res> {
  __$$MovieModelImplCopyWithImpl(
      _$MovieModelImpl _value, $Res Function(_$MovieModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? popularity = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? releaseDate = freezed,
    Object? genreIds = null,
  }) {
    return _then(_$MovieModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      genreIds: null == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$MovieModelImpl implements _MovieModel {
  const _$MovieModelImpl(
      {@HiveField(0) this.title,
      @HiveField(1) this.popularity,
      @HiveField(2) @JsonKey(name: 'vote_average') this.voteAverage,
      @HiveField(3) @JsonKey(name: 'vote_count') this.voteCount,
      @HiveField(4) @JsonKey(name: 'poster_path') this.posterPath,
      @HiveField(5) @JsonKey(name: 'backdrop_path') this.backdropPath,
      @HiveField(6)
      @JsonKey(name: 'release_date')
      @HiveField(7)
      @DateTimeFromJsonConverter()
      this.releaseDate,
      @HiveField(8)
      @JsonKey(name: 'genre_ids')
      final List<int> genreIds = const []})
      : _genreIds = genreIds;

  factory _$MovieModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieModelImplFromJson(json);

  @override
  @HiveField(0)
  final String? title;
  @override
  @HiveField(1)
  final double? popularity;
  @override
  @HiveField(2)
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @HiveField(3)
  @JsonKey(name: 'vote_count')
  final double? voteCount;
  @override
  @HiveField(4)
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @HiveField(5)
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @HiveField(6)
  @JsonKey(name: 'release_date')
  @HiveField(7)
  @DateTimeFromJsonConverter()
  final DateTime? releaseDate;
  final List<int> _genreIds;
  @override
  @HiveField(8)
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds {
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreIds);
  }

  @override
  String toString() {
    return 'MovieModel(title: $title, popularity: $popularity, voteAverage: $voteAverage, voteCount: $voteCount, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, genreIds: $genreIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      popularity,
      voteAverage,
      voteCount,
      posterPath,
      backdropPath,
      releaseDate,
      const DeepCollectionEquality().hash(_genreIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieModelImplCopyWith<_$MovieModelImpl> get copyWith =>
      __$$MovieModelImplCopyWithImpl<_$MovieModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieModelImplToJson(
      this,
    );
  }
}

abstract class _MovieModel implements MovieModel {
  const factory _MovieModel(
      {@HiveField(0) final String? title,
      @HiveField(1) final double? popularity,
      @HiveField(2) @JsonKey(name: 'vote_average') final double? voteAverage,
      @HiveField(3) @JsonKey(name: 'vote_count') final double? voteCount,
      @HiveField(4) @JsonKey(name: 'poster_path') final String? posterPath,
      @HiveField(5) @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @HiveField(6)
      @JsonKey(name: 'release_date')
      @HiveField(7)
      @DateTimeFromJsonConverter()
      final DateTime? releaseDate,
      @HiveField(8)
      @JsonKey(name: 'genre_ids')
      final List<int> genreIds}) = _$MovieModelImpl;

  factory _MovieModel.fromJson(Map<String, dynamic> json) =
      _$MovieModelImpl.fromJson;

  @override
  @HiveField(0)
  String? get title;
  @override
  @HiveField(1)
  double? get popularity;
  @override
  @HiveField(2)
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @HiveField(3)
  @JsonKey(name: 'vote_count')
  double? get voteCount;
  @override
  @HiveField(4)
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @HiveField(5)
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @HiveField(6)
  @JsonKey(name: 'release_date')
  @HiveField(7)
  @DateTimeFromJsonConverter()
  DateTime? get releaseDate;
  @override
  @HiveField(8)
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds;
  @override
  @JsonKey(ignore: true)
  _$$MovieModelImplCopyWith<_$MovieModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
