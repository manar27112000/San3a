import 'package:san3a/models/otp_Forget_model.dart';
import 'package:san3a/models/otp_Register_model.dart';

abstract class OtpRegisterStates {}

class OtpInitialState extends OtpRegisterStates {}

class OtpLoadingState extends OtpRegisterStates {}

class otpSuccessState extends OtpRegisterStates {
  otp_Register_model? otpModel;
  otpSuccessState(this.otpModel);
}

class otpErrorState extends OtpRegisterStates {
  final String error;
  otpErrorState(this.error);
}
