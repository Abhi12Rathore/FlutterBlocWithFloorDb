import 'package:flutter/material.dart';
import 'package:pyxl_assignment/model/Transaction.dart';

class ActivityCard extends StatelessWidget {
  final Transaction transaction;
   ActivityCard({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row
        (mainAxisAlignment:MainAxisAlignment.spaceBetween,crossAxisAlignment:CrossAxisAlignment.start,children: [
          Row(children: [
         CircleAvatar(child: Image.network(transaction?.profileImg.toString()??""),),
    Padding(padding: EdgeInsets.only(left: 8.0),child:
    Column(
            children: [Text(transaction.recipientName??
            "",style: Theme.of(context).textTheme.displaySmall,),Text(transaction.date ??"",style: Theme.of(context).textTheme.displaySmall
          ),
      ],)),],),
    Expanded(child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
            children: [Text(transaction.amount ?? "",style: TextStyle(color: (transaction.isSended)??false ? Colors.red:Colors.blue),),Text(transaction?.time ?? "",style: Theme.of(context).textTheme.displaySmall)],

    )),
    ]));
  }
}
