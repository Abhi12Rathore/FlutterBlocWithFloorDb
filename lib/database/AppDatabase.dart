
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:pyxl_assignment/model/UserData.dart';

import 'UserDao.dart';
import 'dataConverter/AccountDetailsConverter.dart';
import 'dataConverter/CardListConverter.dart';
import 'dataConverter/RecipientListConverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'dataConverter/TransactionListConverter.dart';
part 'AppDatabase.g.dart';

@TypeConverters([AccountDetailsConverter,CardListConverter,RecipientListConverter,TransactionListConverter])
@Database(version: 1, entities: [UserData])
abstract class AppDatabase extends FloorDatabase{

  UserDao get userDao;
}