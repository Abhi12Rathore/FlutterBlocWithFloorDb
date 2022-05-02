
import 'package:pyxl_assignment/model/UserData.dart';

abstract class SendAmountEvent{

}

class SendAmountSendEvent extends SendAmountEvent{
  SendAmountSendEvent(this.userData);
  UserData userData;


  @override
  List<Object?> get props => [];
}