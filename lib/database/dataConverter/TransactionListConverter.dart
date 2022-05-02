import 'dart:convert';

import 'package:floor/floor.dart';

import '../../model/Transaction.dart';

class TransactionListConverter
    extends TypeConverter<List<Transaction>?, String> {
  @override
  List<Transaction>? decode(String databaseValue) {
    List<dynamic> jsonData = jsonDecode(databaseValue);
    return jsonData.map((map) => Transaction.fromJson(map)).toList();
  }

  @override
  String encode(List<Transaction>? value) {
    List<Map<String, dynamic>>? jsonData =
        value?.map((word) => word.toJson()).toList();
    return jsonEncode(jsonData);
  }
}
