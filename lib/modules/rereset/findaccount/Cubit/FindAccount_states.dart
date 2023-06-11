

import 'package:san3a/models/findAccount_model.dart';

abstract class SearchAccountStates {}

class FindAccountInitialState extends SearchAccountStates {}

class FindAccountLoadingState extends SearchAccountStates {}

class FindAccountSuccessState extends SearchAccountStates {
  findAccount_model? SearchModel;
  FindAccountSuccessState(this.SearchModel);
}

class EmailPhoneLoadingState extends SearchAccountStates {}

class EmailPhoneLoadedState extends SearchAccountStates {
  findAccount_model? SearchModel;
  final String email;
  final String phone;
  EmailPhoneLoadedState({required this.email, required this.phone, this.SearchModel});
}

class EmailPhoneErrorState extends SearchAccountStates {
  final String message;
  EmailPhoneErrorState(this.message);
}

class FindAccountErrorState extends SearchAccountStates {
  final String error;
  FindAccountErrorState(this.error);
}
