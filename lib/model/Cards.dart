
import 'package:pyxl_assignment/model/DaylySpend.dart';
import 'package:pyxl_assignment/model/MonthlySpend.dart';
import 'package:pyxl_assignment/model/WeekelySpend.dart';

class Cards{

  String? cardName;
  String? cardNumber;
  String? expiry;
  double? cardBalance;

  // WeekelySpend? weekSpend;
  // MonthlySpend? monthlySpend;
  // DailySpend? dailySpend;

  Cards(this.cardName, this.cardNumber, this.expiry, this.cardBalance,
     );


  Cards.fromJson(Map<String, dynamic> json)
      : cardName = json['cardName'],
        cardNumber = json['cardNumber'],
        expiry = json['expiry'],
        cardBalance = json['cardBalance'];
        // weekSpend = json['weekSpend'],
        // monthlySpend = json['monthlySpend'],
        // dailySpend = json['dailySpend'];

  factory Cards.fromMap(Map<String, dynamic> map) {
    return Cards(
      map['cardName'] as String,
      map['cardName'] as String,
      map['expiry'] as String,
      map['cardBalance'] as double,
      // map['weekSpend'] as WeekelySpend,
      // map['monthlySpend'] as MonthlySpend,
      // map['dailySpend'] as DailySpend,

    );
  }


  Map<String, dynamic> toJson() {
    return {
      'cardName': cardName,
      'cardNumber': cardNumber,
      'expiry': expiry,
      'cardBalance': cardBalance,
      // 'weekSpend': weekSpend,
      // 'monthlySpend': monthlySpend,
      // 'dailySpend': dailySpend,
    };
  }
}