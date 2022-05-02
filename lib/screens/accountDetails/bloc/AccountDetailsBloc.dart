import 'package:bloc/bloc.dart';

import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsEvents.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsRepository.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsState.dart';

class AccountDetailsBloc extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  AccountDetailsRepository? repository;

  AccountDetailsBloc({required this.repository}) : super(AccountDetailsInitialState());



  @override
  AccountDetailsState get initialState => AccountDetailsInitialState();

  @override
  Stream<AccountDetailsState> mapEventToState(AccountDetailsEvent event)async* {
    yield(AccountDetailsInitialState());
    if(event==AccountDetailsEvent.account){
      try {
              var model = await repository?.fetchUserData();
              if (model != null) {
                print("data"+model.userId.toString());
                yield(AccountDetailsFetchState(model));
              } else {
                yield(AccountDetailsErrorState(''));
              }
            } catch (error, stack) {
              print(stack.toString());
              yield(AccountDetailsErrorState(error.toString()));
            }

    }
  }
}
