import 'package:flutter/material.dart';
import 'package:pyxl_assignment/model/Cards.dart';

import '../../../helper/AppData.dart';

class CardWidget extends StatefulWidget {
  final Cards cards;
  final int index;
  Function cardIndexValue;

   CardWidget({Key? key, required this.cards, required this.index, required this. cardIndexValue})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> cardIcons = [
      'assets/images/icons/mastercard.png',
      'assets/images/icons/visa-logo.png'
    ];
    return Container(
        padding: const EdgeInsets.all(8.0),
        height: 100,
        child: TextButton(
            style: ButtonStyle(
                backgroundColor: AppData.selectedCardIndex == widget.index
                    ? MaterialStateProperty.all(Colors.blue)
                    : MaterialStateProperty.all(Colors.grey[400])),
            onPressed: () {
              setState(() {
                AppData.selectedCardIndex=widget.index;
              });
  },
            child: Row(children: [
              Image.asset(cardIcons[widget.index]),
              Padding(
                padding: const EdgeInsets.only(
                  left: 4.0,
                ),
                child: Text(
                  widget.cards.cardName ?? "",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              )
            ])));
  }
}
