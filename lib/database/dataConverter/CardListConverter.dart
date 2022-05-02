import 'dart:convert';

import 'package:floor/floor.dart';

import '../../model/Cards.dart';

class CardListConverter extends TypeConverter<List<Cards>?, String> {
  @override
  List<Cards>? decode(String databaseValue) {
    List<dynamic> jsonData = jsonDecode(databaseValue);
    return jsonData.map((map) =>  Cards.fromMap(map)).toList();
  }

  @override
  String encode(List<Cards>? value) {
      List<Map<String, dynamic>>? jsonData = value?.map((word) => word.toJson()).toList();
    return jsonEncode(jsonData);
  }
}
