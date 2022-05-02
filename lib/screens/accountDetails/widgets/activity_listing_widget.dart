import 'package:flutter/material.dart';
import 'package:pyxl_assignment/helper/StringContants.dart';
import 'package:pyxl_assignment/model/UserData.dart';
import 'package:pyxl_assignment/screens/accountDetails/widgets/activity_card_widget.dart';
class ActivityListingWidget extends StatelessWidget {
  final UserData userData;
   const ActivityListingWidget({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height,child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppString.recentActivity,style: Theme.of(context).textTheme.displayLarge,),
            Row(
              children: [
                Text(AppString.all,style: Theme.of(context).textTheme.displaySmall),
               const Icon(Icons.keyboard_arrow_down),
              ],
            ),

          ],
        ),
        Expanded(child:
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: userData?.transactionList?.length,
            itemBuilder: (context,index){
              return ActivityCard(transaction: userData.transactionList![index],);
            }))
      ],
    ));
  }
}
