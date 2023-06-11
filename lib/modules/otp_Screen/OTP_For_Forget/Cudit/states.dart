import 'package:san3a/models/otp_Forget_model.dart';

abstract class OtpForgetStates {}

class OtpInitialState extends OtpForgetStates {}

class OtpLoadingState extends OtpForgetStates {}

class otpSuccessState extends OtpForgetStates {
  otp_Forget_model? otpModel;
  otpSuccessState(this.otpModel);
}

class otpErrorState extends OtpForgetStates {
  final String error;
  otpErrorState(this.error);
}
