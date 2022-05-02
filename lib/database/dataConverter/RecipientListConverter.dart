import 'dart:convert';

import 'package:floor/floor.dart';

import '../../model/Recipient.dart';

class RecipientListConverter extends TypeConverter<List<Recipient>?, String> {
  @override
  List<Recipient>? decode(String databaseValue) {
    List<dynamic> jsonData = jsonDecode(databaseValue);
    return jsonData.map((map) =>  Recipient.fromJson(map)).toList();
  }

  @override
  String encode(List<Recipient>? value) {
    List<Map<String, dynamic>>? jsonData = value?.map((word) => word.toJson()).toList();
    return jsonEncode(jsonData);
  }
}
