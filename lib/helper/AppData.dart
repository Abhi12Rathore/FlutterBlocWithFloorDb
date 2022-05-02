
import 'package:flutter/cupertino.dart';

import '../database/AppDatabase.dart';
import '../model/UserData.dart';

class AppData{
  static int selectedIndex=0;
  static UserData? userData;
 static  AppDatabase? appDatabase;
 static int selectedCardIndex=-1;
}