import 'package:flutter/material.dart';
import 'package:pyxl_assignment/helper/StringContants.dart';
import 'package:pyxl_assignment/model/UserData.dart';

class AccountBalanceWidget extends StatelessWidget {
  final UserData? userData;

  const AccountBalanceWidget({Key? key, this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height/3,child:
      Card(
      color: Colors.blue,
      child: Padding(padding: const  EdgeInsets.all(8.0)
    ,
    child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userData?.accountDetails?.accountName ?? '',style: Theme.of(context).textTheme.bodySmall,),
              Text(userData?.accountDetails?.accountHolderName ?? "",style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Column(
            children: <Widget>[
              Text("\$"+(userData?.accountDetails?.accountBalance.toString() ?? ""),style: Theme.of(context).textTheme.bodyLarge),
              Text(AppString.totalBalance,style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(userData?.cardsList?[0].cardName ?? "",style: Theme.of(context).textTheme.bodySmall),
              Row(
                children: [
                  Text(AppString.accNumber,style: Theme.of(context).textTheme.bodySmall),
                  Text(userData?.accountDetails?.accountNumber??'',style: Theme.of(context).textTheme.bodySmall)],
          ),
        ],
      ),
          ]))));
  }
}
