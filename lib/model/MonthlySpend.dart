class MonthlySpend{
  String? totalSpend;
  String? shopping;
  String? others;
  String? monthlyIncome;

  MonthlySpend(this.totalSpend, this.shopping, this.others,this.monthlyIncome);

  MonthlySpend.fromJson(Map<String, dynamic> json)
      : totalSpend = json['totalSpend'],
        shopping = json['shopping'],
        others = json['others'],
        monthlyIncome = json['monthlyIncome'];

  Map<String, dynamic> toJson() {
    return {
      'totalSpend': totalSpend,
      'shopping': shopping,
      'others': others,
      'monthlyIncome': monthlyIncome,
    };
  }
}