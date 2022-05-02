
import 'package:floor/floor.dart';
import 'package:pyxl_assignment/model/UserData.dart';

@dao
abstract class UserDao{

  @Query('SELECT * FROM UserData')
  Future<UserData?> fetchUserData();

  @insert
  Future<void> addUserData(UserData person);

  @Query('DELETE FROM UserData')
  Future<void> deleteData();


}