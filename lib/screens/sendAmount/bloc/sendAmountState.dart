
abstract class SendAmountState{}

class SendAmountInitialState extends SendAmountState{

  SendAmountInitialState();

  @override
  List<Object?> get props => [];

}

class SendAmountSendState extends SendAmountState{
  SendAmountSendState();

  @override
  List<Object?> get props => [];
}

class SendAmountErrorState extends SendAmountState{
  String error;

  SendAmountErrorState(this.error);

  @override
  List<Object?> get props => [];
}
