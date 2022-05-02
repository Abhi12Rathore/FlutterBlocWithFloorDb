
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyxl_assignment/screens/sendAmount/bloc/sendAmountEvents.dart';
import 'package:pyxl_assignment/screens/sendAmount/bloc/sendAmountRepository.dart';
import 'package:pyxl_assignment/screens/sendAmount/bloc/sendAmountState.dart';

class SendAmountBloc extends Bloc<SendAmountSendEvent,SendAmountState>{
  SendAmountRepository? repository;
  SendAmountBloc({required this.repository}) : super(SendAmountInitialState());


  @override
  SendAmountState get initialState => SendAmountInitialState();

  @override
  Stream<SendAmountState> mapEventToState(SendAmountSendEvent event)async* {
   if(event==SendAmountSendEvent){
     try {
       var model = await repository?.sendAmount(event.userData);
         yield(SendAmountSendState());

     } catch (error, stack) {
       print(stack.toString());
       yield(SendAmountErrorState(error.toString()));
     }
   }
  }

}