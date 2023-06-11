import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/payment_screen/Network/dioHelperPayment.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_state.dart';
import 'package:san3a/shared/component/constant.dart';

class PaymentCubitCubit extends Cubit<PaymentCubitState>{
  PaymentCubitCubit():super(PaymentCubitInitial());
  static PaymentCubitCubit get(context)=>BlocProvider.of(context);
  Future<void> getAuthToken()async{
    emit(PaymentAuthLoadingState());
    DioHelper.postDataDio(
        url: ApiConst.getAuthToken,
        data:{
        "api_key":ApiConst.paymentApiKey,
    } ).then((value){
      ApiConst.paymentFirstToken=value.data[token];
      emit(PaymentAuthSucessState());
    }).catchError((error){
      emit(PaymentAuthErrorState());
    });
  }
  /////////////////////////////////////////////////////////////////////////
  Future getOrderRegisterationId({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String price,
     })async{
    emit(PaymentGetOrderRegistrationIdLoadingState());
    DioHelper.postDataDio(url: ApiConst.getOrderId,data: {
      //data 1
    }).then((value){
      ApiConst.payementOrderId=value.data['id'];
      getPaymentRequest(firstname: firstname, lastname: lastname, email: email, phone: phone, price: price);
      emit(PaymentGetOrderRegistrationIdSucessState());
    }).catchError((error){emit(PaymentGetOrderRegistrationIdErrorState());});
  }

Future<void>getPaymentRequest({
  required String firstname,
  required String lastname,
  required String email,
  required String phone,
  required String price,
})async{
    emit(getPaymentRequestRegistrationIdLoadingState());
    DioHelper.postDataDio(url: ApiConst.getPaymentId,data: {
      //data 3
    }).then((value) {ApiConst.finalToken=value.data.token;
    emit(getPaymentRequestRegistrationIdSucessState());
    }).catchError((error){
      emit(getPaymentRequestRegistrationIdErrorState());
    });
}

Future<void>getRefCode()async{
emit(getRefCodeRegistrationIdLoadingState());
DioHelper.postDataDio(url: ApiConst.getRefCode,data:{
  //kosik code source
  //"payment_token":ApiConst.finalToken,
} ).then((value){ApiConst.refCode=value.data['id'].toString();
emit(getRefCodeRegistrationIdSucessState());}).catchError((error){
  emit(getRefCodeRegistrationIdErrorState());
});
}



}