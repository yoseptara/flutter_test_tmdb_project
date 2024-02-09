import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'genre_model.freezed.dart';
part 'genre_model.g.dart';

@freezed
class GenreModel with _$GenreModel {
  @HiveType(typeId: 0)
  const factory GenreModel({
    @HiveField(0)
    required int id,
    @HiveField(1)
    required String name,
}) = _GenreModel;

  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);
 // Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}