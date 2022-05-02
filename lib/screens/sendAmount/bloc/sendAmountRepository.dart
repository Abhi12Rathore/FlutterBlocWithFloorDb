
import 'dart:ffi';

import 'package:pyxl_assignment/model/UserData.dart';

import '../../../helper/AppData.dart';

abstract class SendAmountRepository{
  Future<void> sendAmount(UserData userData);
}

class SendAmountRepositoryImp extends SendAmountRepository{
  @override
  Future<void> sendAmount(UserData userData) {

    return AppData.appDatabase!.userDao.addUserData(userData);
  }

}