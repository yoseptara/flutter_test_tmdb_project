// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelImplAdapter extends TypeAdapter<_$MovieModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$MovieModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MovieModelImpl(
      title: fields[0] as String?,
      popularity: fields[1] as double?,
      voteAverage: fields[2] as double?,
      voteCount: fields[3] as double?,
      posterPath: fields[4] as String?,
      backdropPath: fields[5] as String?,
      releaseDate: fields[6] as DateTime?,
      genreIds: (fields[8] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$MovieModelImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.popularity)
      ..writeByte(2)
      ..write(obj.voteAverage)
      ..writeByte(3)
      ..write(obj.voteCount)
      ..writeByte(4)
      ..write(obj.posterPath)
      ..writeByte(5)
      ..write(obj.backdropPath)
      ..writeByte(6)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.genreIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieModelImpl _$$MovieModelImplFromJson(Map<String, dynamic> json) =>
    _$MovieModelImpl(
      title: json['title'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      releaseDate:
          const DateTimeFromJsonConverter().fromJson(json['release_date']),
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MovieModelImplToJson(_$MovieModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'release_date':
          const DateTimeFromJsonConverter().toJson(instance.releaseDate),
      'genre_ids': instance.genreIds,
    };
