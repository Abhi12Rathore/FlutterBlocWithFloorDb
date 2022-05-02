// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyxl_assignment/helper/AppColor.dart';
import 'package:pyxl_assignment/helper/AppData.dart';
import 'package:pyxl_assignment/helper/Utility.dart';
import 'package:pyxl_assignment/screens/BottomBar/BottomBar.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsBloc.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsRepository.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pyxl_assignment/screens/sendAmount/bloc/sendAmountBloc.dart';
import 'package:pyxl_assignment/screens/sendAmount/bloc/sendAmountRepository.dart';
import 'database/AppDatabase.dart';
import 'package:toast/toast.dart';
import 'package:overlay_support/overlay_support.dart';
void main() async {
  await GetStorage.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) =>
            AccountDetailsBloc(repository: AccountDetailsRepositoryImp())),   BlocProvider(
        create: (_) =>
            SendAmountBloc(repository: SendAmountRepositoryImp()))
  ], child: (MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return OverlaySupport.global(child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const  TextTheme(
          bodySmall:  TextStyle(color: Colors.white,fontSize: 14.0),
          bodyMedium:  TextStyle(color: Colors.white,fontSize: 20.0),
          bodyLarge:  TextStyle(color: Colors.white,fontSize: 24.0),
          displaySmall: TextStyle(color: Colors.black,fontSize: 16.0),
            displayLarge: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),
          displayMedium: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          labelSmall: TextStyle(color: Colors.black,fontSize:14.0)
        )
      ),
      home: MyHomePage(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppDatabase appDatabase;

  @override
  void initState() {
    $FloorAppDatabase
        .databaseBuilder('user_database.db')
        .build()
        .then((value) async {
      appDatabase = value;
      AppData.appDatabase = appDatabase;
      if (Utility.isSaved()==null || !Utility.isSaved()) {
        await addUserData(appDatabase);
      }

      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => BottomBar())));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.myColor,
    );
  }

  Future<void> addUserData(AppDatabase appDatabase) async {
    Utility.setDataSaved(true);
    return appDatabase.userDao.addUserData(Utility.prepareUserData());
  }
}
