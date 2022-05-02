
import 'package:floor/floor.dart';
import 'package:pyxl_assignment/model/Cards.dart';
import 'package:pyxl_assignment/model/Transaction.dart';

import 'AccountDetails.dart';
import 'Recipient.dart';

@entity
class UserData{

  @PrimaryKey(autoGenerate: true)
   int? userId;

  String? userName;

  String? emailId;

  String? profileImg;

  AccountDetails? accountDetails;

  List<Cards>? cardsList;

  List<Recipient>? recipientList;

  List<Transaction>? transactionList;

  UserData(this.userId, this.userName, this.emailId, this.accountDetails,
      this.cardsList, this.recipientList, this.transactionList,this.profileImg);

  // UserData.fromJson(Map<String, dynamic> json)
  //     : userId = json['userId'],
  //       userName = json['userName'],
  //       emailId = json['emailId'],
  //       profileImg = json['profileImg'],
  //       accountDetails = json['accountDetails'],
  //       cardsList = json['cardsList'],
  //       recipientList = json['recipientList'],
  //       transactionList = json['transactionList'];
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'userId': userId,
  //     'userName': userName,
  //     'emailId': emailId,
  //     'profileImg': profileImg,
  //     'accountDetails': accountDetails,
  //     'cardsList': cardsList,
  //     'recipientList': recipientList,
  //     'transactionList': transactionList,
  //   };
  // }
}