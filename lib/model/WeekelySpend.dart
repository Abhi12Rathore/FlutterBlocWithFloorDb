
class WeekelySpend{

  String? totalSpend;
  String? shopping;
  String? others;
  String? weeklyIncome;

  WeekelySpend(this.totalSpend, this.shopping, this.others,this.weeklyIncome);


  WeekelySpend.fromJson(Map<String, dynamic> json)
      : totalSpend = json['totalSpend'],
        shopping = json['shopping'],
        others = json['others'],
        weeklyIncome = json['weeklyIncome'];

  Map<String, dynamic> toJson() {
    return {
      'totalSpend': totalSpend,
      'shopping': shopping,
      'others': others,
      'weeklyIncome': weeklyIncome,
    };
  }
}