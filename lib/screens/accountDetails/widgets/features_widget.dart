import 'package:flutter/material.dart';
import 'package:pyxl_assignment/helper/StringContants.dart';
import 'package:pyxl_assignment/model/UserData.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsBloc.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsEvents.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsState.dart';
import 'package:pyxl_assignment/screens/sendAmount/SendAmountScreen.dart';

class FeaturesWidget extends StatefulWidget {
  final UserData userData;
  final AccountDetailsBloc? accountDetailsBloc;

  const FeaturesWidget({Key? key, required this.userData,required this.accountDetailsBloc}) : super(key: key);

  @override
  State<FeaturesWidget> createState() => _FeaturesWidgetState();
}

class _FeaturesWidgetState extends State<FeaturesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.features,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(AppString.seeMore,
                  style: Theme.of(context).textTheme.displaySmall)
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[200])),
                      onPressed: () {
                       var result = Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                SendAmountScreen(userData: widget.userData))).then((value) {
                                  setState(() {

                                  });
                       });
                       if(result==true){
                         widget.accountDetailsBloc?.add(AccountDetailsEvent.account);
                         widget.accountDetailsBloc?.emit(AccountDetailsInitialState());
                       }
                      },
                      child: Row(children: [
                        Image.asset('assets/images/icons/money-send.png'),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.0,
                          ),
                          child: Text(AppString.sendMoney),
                        )
                      ], crossAxisAlignment: CrossAxisAlignment.center)),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[200])),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset('assets/images/icons/money-send.png'),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 4.0,
                            ),
                            child: Text(AppString.receive),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      )),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[200])),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset('assets/images/icons/Vector.png'),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 4.0,
                            ),
                            child: Text(AppString.rewards),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
