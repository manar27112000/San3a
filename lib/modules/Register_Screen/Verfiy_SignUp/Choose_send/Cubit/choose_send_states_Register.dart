import 'package:san3a/models/ChooseSendRegister_model.dart';
import 'package:san3a/models/Choose_send_model.dart';



abstract class ChooseSendStatesRegister {}

class ChooseInitialRegisterState extends ChooseSendStatesRegister {}

class ChooseLoadingRegisterState extends ChooseSendStatesRegister {}

class UserChooseSendRegisterState extends ChooseSendStatesRegister {}

class ChooseSuccessRegisterState extends ChooseSendStatesRegister {
  ChooseSendRegister_model? chooseSendRegister;
  ChooseSuccessRegisterState(this.chooseSendRegister);
}

class ChooseSendErorrRegisterState extends ChooseSendStatesRegister {
  final String erorr;
  ChooseSendErorrRegisterState(this.erorr);
}


