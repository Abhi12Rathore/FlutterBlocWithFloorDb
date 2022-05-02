import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyxl_assignment/helper/AppData.dart';
import 'package:pyxl_assignment/model/UserData.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsEvents.dart';
import 'package:pyxl_assignment/screens/accountDetails/bloc/AccountDetailsState.dart';
import 'package:pyxl_assignment/screens/accountDetails/widgets/account_balance_widget.dart';
import 'package:pyxl_assignment/screens/accountDetails/widgets/activity_listing_widget.dart';
import 'package:pyxl_assignment/screens/accountDetails/widgets/features_widget.dart';
import '../../widgets/custom_app_bar.dart';
import 'bloc/AccountDetailsBloc.dart';


class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountDetails();
}

class _AccountDetails extends State<AccountDetails> {
  bool isLoading = false;
  AccountDetailsBloc? _accountDetailsBloc;

  @override
  void initState() {
    super.initState();
    callFun();
  }

  void callFun() async{
    context.read<AccountDetailsBloc>().add(AccountDetailsEvent.account);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: customAppBarWidget(context), preferredSize: Size(MediaQuery.of(context).size.width,50.0)),
      body: SafeArea(child: _buildMainUi()),
    );
  }

  Widget _buildMainUi() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _accountDetailsBloc,
        child: BlocListener<AccountDetailsBloc, AccountDetailsState>(
          listener: (context, state) {
            if (state is AccountDetailsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                ),
              );
            }
          },
          child: BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
            builder: (context, state) {
              if (state is AccountDetailsInitialState) {
                return _buildLoading();
              } else if (state is AccountDetailsFetchState) {
                AppData.userData=state.userData;
                return _buildCard(context, state.userData);
              } else if (state is AccountDetailsErrorState) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, UserData userData) {
  return SingleChildScrollView(child: Column(
      children: [
       AccountBalanceWidget(userData: userData,),
        FeaturesWidget(userData: userData,accountDetailsBloc: _accountDetailsBloc),
        ActivityListingWidget(userData: userData)
    ],
  ));
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
