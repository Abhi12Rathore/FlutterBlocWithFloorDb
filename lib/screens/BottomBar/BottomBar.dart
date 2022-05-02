import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyxl_assignment/helper/AppData.dart';
import 'package:pyxl_assignment/screens/accountDetails/AccountDetails.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsBloc.dart';
import 'package:pyxl_assignment/screens/wallet/WalletScreen.dart';

import '../Gift.dart';

class BottomBar extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  final pages= [
    AccountDetails(),
    WalletScreen(),
    Gift(),
    Gift()
  ];


  void _onItemTapped(int index) {
    setState(() {
      AppData.selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: pages.elementAt(AppData.selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_travel),
              label: "",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: "",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "",
              backgroundColor: Colors.blue,
            ),
          ],
          currentIndex: AppData.selectedIndex,
         // selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
