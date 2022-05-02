import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyxl_assignment/helper/AppData.dart';
import 'package:pyxl_assignment/helper/StringContants.dart';
import 'package:pyxl_assignment/model/Recipient.dart';
import 'package:pyxl_assignment/model/Transaction.dart';
import 'package:pyxl_assignment/model/UserData.dart';
import 'package:pyxl_assignment/screens/sendAmount/bloc/sendAmountBloc.dart';
import 'package:pyxl_assignment/screens/sendAmount/bloc/sendAmountState.dart';
import 'package:pyxl_assignment/screens/sendAmount/widgets/card_types_widget.dart';
import 'package:pyxl_assignment/screens/sendAmount/widgets/card_widget.dart';
import 'package:pyxl_assignment/widgets/custom_app_bar.dart';
import 'package:toast/toast.dart';
import 'package:overlay_support/overlay_support.dart';

import '../accountDetails/AccountDetails.dart';

class SendAmountScreen extends StatefulWidget {
  final UserData userData;

  const SendAmountScreen({Key? key, required this.userData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SendAmountScreen();
}

class _SendAmountScreen extends State<SendAmountScreen> {
  SendAmountBloc? _sendAmountBloc;
  bool isLoading = false;
  TextEditingController? receipentController;
  late TextEditingController amountController;
  List<bool> isSelected = [];
  int cardSelectedIndex = -1;
  int avatarSelectedIndex = -1;

  @override
  void initState() {
    super.initState();
    receipentController = TextEditingController();
    amountController = TextEditingController();
    callFun();
  }

  void callFun() async {
    _sendAmountBloc = context.read<SendAmountBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: mainUi(),
    );
  }

  Widget mainUi() {
    return Container(
      //  margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _sendAmountBloc,
        child: BlocListener<SendAmountBloc, SendAmountState>(
          listener: (context, state) {
            if (state is SendAmountErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: BlocBuilder<SendAmountBloc, SendAmountState>(
            builder: (context, state) {
              if (state is SendAmountInitialState) {
                isLoading = false;
                return _buildMainUi();
              } else if (state is SendAmountSendState) {
                return _buildLoading();
              } else if (state is SendAmountErrorState) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  void selectedValue(int index) {
    setState(() {
      cardSelectedIndex = index;
      AppData.selectedCardIndex = index;
    });
  }

  Widget _buildMainUi() {
    List<String> cardIcons = [
      'assets/images/icons/mastercard.png',
      'assets/images/icons/visa-logo.png'
    ];
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
            child: customAppBarWidget(context),
            preferredSize: Size(MediaQuery
                .of(context)
                .size
                .width, 50.0)),
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                    child: Text(
                      AppString.sendMoney,
                      style: Theme
                          .of(context)
                          .textTheme
                          .displayMedium,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.selectCard,
                        style: Theme
                            .of(context)
                            .textTheme
                            .displayLarge,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.userData.cardsList?.length,
                            itemBuilder: (context, index) {
                              return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(8.0),
                                        height: 100,
                                        child: TextButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                cardSelectedIndex == index
                                                    ? MaterialStateProperty.all(
                                                    Colors.blue)
                                                    : MaterialStateProperty.all(
                                                    Colors.grey[400])),
                                            onPressed: () {
                                              setState(() {
                                                cardSelectedIndex = index;
                                              });
                                            },
                                            child: Row(children: [
                                              Image.asset(cardIcons[index]),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4.0,
                                                ),
                                                child: Text(
                                                  widget.userData
                                                      .cardsList![index]
                                                      .cardName
                                                      .toString() ??
                                                      "",
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                              )
                                            ])))
                                  ]);
                            }),
                      )
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.chooseRecipient,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displayLarge,
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: receipentController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors
                                          .white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors
                                          .white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors
                                          .white)),
                                  hintText: AppString.chooseRecipient,
                                  suffixIcon: Icon(Icons.lock)),
                            ),
                          ])),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.userData.recipientList?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        avatarSelectedIndex = index;
                                      });
                                    },
                                    child: CircleAvatar(
                                        backgroundColor:
                                        avatarSelectedIndex == index
                                            ? Colors.blue
                                            : Colors.white,
                                        radius: 34.0,
                                        child: CircleAvatar(
                                            radius: 30.0,
                                            child: Image.network(widget
                                                .userData
                                                .recipientList![index]
                                                .profileImage ??
                                                "",)))));
                          }),
                    ),
                  ]),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(AppString.amount,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displayLarge),
                          SizedBox(
                            height: 8.0,
                          ),
                          TextFormField(
                            controller: amountController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: AppString.amount,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          CheckboxListTile(
                            value: true,
                            onChanged: (value) {},
                            title: Text(AppString.agreeWithTerms),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 50.0,
                              child: ElevatedButton(
                                  onPressed: () async{
                                    if (cardSelectedIndex == -1) {
                                      showSimpleNotification(
                                        const Text(
                                            "Please select atleast one card"),
                                        background: Colors.red,
                                      );
                                      return;
                                    }

                                    if (avatarSelectedIndex == -1) {
                                      showSimpleNotification(
                                          const Text(
                                            "Please select user which you want to send money",
                                          ),
                                          background: Colors.red);
                                      return;
                                    }

                                    if (amountController.text.isEmpty) {
                                      showSimpleNotification(
                                          const Text(
                                              "Please enter the amount"),
                                          background: Colors.red);
                                      return;
                                    }

                                    if (double.parse(amountController.text) >
                                        (widget
                                            .userData
                                            .cardsList?[cardSelectedIndex]
                                            .cardBalance ??
                                            0.0)) {
                                      showSimpleNotification(
                                          Text(
                                            "Please enter valid amount, not more than your card balance that is" +
                                                (widget
                                                    .userData
                                                    .cardsList?[cardSelectedIndex]
                                                    .cardBalance ??
                                                    0.0).toString(),
                                          ),
                                          background: Colors.red);
                                      return;
                                    }

                                    double deductedAmount =  double.parse(amountController.text)
                                           ;
                                    widget
                                        .userData
                                        .cardsList?[cardSelectedIndex]
                                        .cardBalance = deductedAmount;

                                    Transaction transaction = Transaction(widget
                                        .userData
                                        .recipientList?[avatarSelectedIndex]
                                        .name, widget
                                        .userData
                                        .recipientList?[avatarSelectedIndex]
                                        .profileImage, "03/05/2022", "10:23AM",
                                        true, "\$" + deductedAmount.toString());

                                    widget.userData.transactionList?.add(transaction);
                                    await  AppData.appDatabase?.userDao.deleteData().then((value) {
                                        AppData.appDatabase?.userDao.addUserData( widget.userData).then((value) {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountDetails()));

                                      });
                                    });

                                  },
                                  child: Text(
                                    AppString.sendMoney,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyMedium,
                                  )))
                        ],
                      ))
                ],
              ),
            )));
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
