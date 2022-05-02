import 'package:flutter/material.dart';
import 'package:pyxl_assignment/helper/StringContants.dart';

Widget customAppBarWidget(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white,
    leading: Padding(
      padding: EdgeInsets.all(8.0),
      child: ClipOval(
        child: CircleAvatar(
          child: Image.asset('assets/images/icons/avatar-frame.png'),
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
    ),
    title: Text(
      AppString.goodDayMessage,
      style: Theme.of(context).textTheme.displaySmall,
    ),
    actions: [
      Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Icon(Icons.search),
            backgroundColor: Colors.lightBlueAccent[200],
          ))
    ],
  );
}
