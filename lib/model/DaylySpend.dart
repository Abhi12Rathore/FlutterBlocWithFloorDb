
class DailySpend{
  String? totalSpend;
  String? shopping;
  String? others;
  String? dailyIncome;

  DailySpend(this.totalSpend, this.shopping, this.others,this.dailyIncome);


  DailySpend.fromJson(Map<String, dynamic> json)
      : totalSpend = json['totalSpend'],
        shopping = json['shopping'],
        others = json['others'],
        dailyIncome = json['dailyIncome'];

  Map<String, dynamic> toJson() {
    return {
      'totalSpend': totalSpend,
      'shopping': shopping,
      'others': others,
      'dailyIncome': dailyIncome,
    };
  }
}