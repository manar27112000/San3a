import 'package:flutter/material.dart';
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
      print("the tooooooooken${ ApiConst.paymentFirstToken=value.data[token]}");
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
        "auth_token": ApiConst.paymentFirstToken,
        "delivery_needed": "false",
        "amount_cents": "100",
        "currency": "EGP",
        "merchant_order_id": 5,
        "items": [],
    }
    ).then((value){
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
    DioHelper.postDataDio(url: ApiConst.getPaymentId,data:{
      "auth_token":ApiConst.paymentFirstToken,
      "amount_cents": 100,
      "expiration": 3600,
      "order_id": ApiConst.payementOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": "m@gmail.com",
        "floor": "NA",
        "first_name": "mohamed",
        "street": "NA",
        "building": "NA",
        "phone_number": "01150041361",
        "shipping_method":"NA",
        "postal_code":"NA",
        "city": "NA",
        "country":"NA",
        "last_name": "ahmed",
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": ApiConst.integrationIdCart,
      "lock_order_when_paid": "false"
    }).then((value) {ApiConst.finalToken=value.data.token;
    emit(getPaymentRequestRegistrationIdSucessState());
    }).catchError((error){
      emit(getPaymentRequestRegistrationIdErrorState());
    });
}

Future<void>getRefCode()async{
emit(getRefCodeRegistrationIdLoadingState());
DioHelper.postDataDio(url: ApiConst.getRefCode,data:{
"source": {
"identifier": "AGGREGATOR",
"subtype": "AGGREGATOR"
},
"payment_token": ApiConst.finalToken
}
 ).then((value){ApiConst.refCode=value.data['id'].toString();
emit(getRefCodeRegistrationIdSucessState());}).catchError((error){
  emit(getRefCodeRegistrationIdErrorState());
});
}

  void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => widget,
    ),
        (route) => false,
  );

}