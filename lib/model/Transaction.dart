
class Transaction{

  String? recipientName;
  String? profileImg;
  String? date;
  String? time;
  bool? isSended;
  String? amount;

  Transaction(this.recipientName, this.profileImg, this.date, this.time,
      this.isSended, this.amount);


  Transaction.fromJson(Map<String, dynamic> json)
      : recipientName = json['recipientName'],
        profileImg = json['profileImg'],
        date = json['date'],
        time = json['time'],
        isSended = json['isSended'],
        amount = json['amount'];


  Map<String, dynamic> toJson() {
    return {
      'recipientName': recipientName,
      'profileImg': profileImg,
      'date': date,
      'time': time,
      'isSended': isSended,
      'amount': amount,
    };
  }
}