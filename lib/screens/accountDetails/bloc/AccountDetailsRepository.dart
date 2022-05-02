import 'package:pyxl_assignment/helper/AppData.dart';
import 'package:pyxl_assignment/model/UserData.dart';

import '../../../database/AppDatabase.dart';

abstract class AccountDetailsRepository {
  Future<UserData?> fetchUserData();
}

class AccountDetailsRepositoryImp extends AccountDetailsRepository {
  @override
  Future<UserData?> fetchUserData() async {
    return AppData.appDatabase!.userDao.fetchUserData();
  }
}
