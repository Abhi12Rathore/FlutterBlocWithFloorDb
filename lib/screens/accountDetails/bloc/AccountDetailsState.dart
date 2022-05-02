
import 'package:pyxl_assignment/model/UserData.dart';

abstract class AccountDetailsState{}

class AccountDetailsInitialState extends AccountDetailsState{

  AccountDetailsInitialState();

  @override
  List<Object?> get props => [];
}

class AccountDetailsFetchState extends AccountDetailsState{
  UserData userData;

  AccountDetailsFetchState(this.userData);

  @override
  List<Object?> get props => [];
}

class AccountDetailsErrorState extends AccountDetailsState{
   String? errorMessage;
   AccountDetailsErrorState(this.errorMessage);

   @override
   List<Object?> get props => [];

}