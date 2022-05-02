import 'package:flutter/material.dart';
import 'package:pyxl_assignment/model/UserData.dart';

import '../../../helper/StringContants.dart';
import 'card_widget.dart';

class CardTypesWidget extends StatelessWidget {
  final UserData userData;
  final Function indexValue;

  const CardTypesWidget({Key? key, required this.userData,required  this.indexValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.selectCard,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: userData.cardsList?.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CardWidget(
                        cards: userData.cardsList![index],
                        index: index,
                        cardIndexValue: indexValue,
                      )
                    ]);
              }),
        )
      ],
    );
  }
}
