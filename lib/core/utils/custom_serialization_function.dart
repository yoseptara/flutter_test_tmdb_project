import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';


class RegencyFromJsonConverter implements JsonConverter<String?, dynamic> {
  const RegencyFromJsonConverter() : super();

  @override
  String? fromJson(dynamic json) {
    if (json != null && json != 'null') {
      if (json is String) {
        // if (json.contains('Kota') || json.contains('Kabupaten')) {
        //   // print('regency json : $json');
        // }
        String finalJson = json.replaceAll('Kota ', '');
        finalJson = finalJson.replaceAll('Kabupaten ', '');
        return finalJson;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  dynamic toJson(String? object) => jsonEncode(object);
}

class DateTimeFromJsonConverter implements JsonConverter<DateTime?, dynamic> {
  const DateTimeFromJsonConverter() : super();

  @override
  DateTime? fromJson(dynamic json) {
    if (json != null && json != 'null' && json != '') {
      if (json is String) {
       return DateTime.tryParse(json);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  dynamic toJson(DateTime? object) => jsonEncode(object);
}

