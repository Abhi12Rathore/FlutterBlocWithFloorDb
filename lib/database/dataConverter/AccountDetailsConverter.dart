
 import 'dart:convert';

import 'package:floor/floor.dart';

import '../../model/AccountDetails.dart';

class AccountDetailsConverter extends TypeConverter<AccountDetails?,String>{
  @override
  AccountDetails? decode(String databaseValue) {
    return AccountDetails.fromJson(jsonDecode(databaseValue));
  }

  @override
  String encode(AccountDetails? value) {
    return jsonEncode(value);
  }
  
}