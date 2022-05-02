
class AccountDetails{

  String? accountName;
  String? accountNumber;
  String? accountHolderName;
  double? accountBalance;

  AccountDetails(this.accountName, this.accountNumber, this.accountHolderName,
      this.accountBalance);

  AccountDetails.fromJson(Map<String, dynamic> json)
      : accountName = json['accountName'],
        accountNumber = json['accountNumber'],
        accountHolderName = json['accountHolderName'],
        accountBalance = json['accountBalance'];

  Map<String, dynamic> toJson() {
    return {
      'accountName': accountNumber,
      'accountNumber': accountNumber,
      'accountHolderName': accountHolderName,
      'accountBalance': accountBalance,
    };
  }
}