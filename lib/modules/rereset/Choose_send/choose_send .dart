import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Forget/OTPscreen2.dart';
import 'package:san3a/modules/rereset/Choose_send/Cubit/choose_send_cubit.dart';
import 'package:san3a/modules/rereset/Choose_send/Cubit/choose_send_states.dart';
import 'package:san3a/modules/rereset/findaccount/FindAcount.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';


class choose_send extends StatelessWidget {

  final String email;
  final String phone;

  choose_send({required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChooseSendCubit(),
      child: BlocConsumer<ChooseSendCubit, ChooseSendStates>(
        listener: (context, state) {
          if (state is chooseSuccessState) {
            if (state.chooseSend!.status) {
              print(state.chooseSend?.message);
              // print(state.findAccountModel?.data?.token);
               navigateAndFinish(context, OTPscreen2(typesend: ChooseSendCubit.get(context).type, phone: phone, ));
              showToast(
                  text: state.chooseSend!.message,
                  state: ToastState.SUCCESS);
            } else {
              print(state.chooseSend!.message);
              showToast(
                text: state.chooseSend!.message,
                state: ToastState.ERORR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Image(
                                image: AssetImage('assets/images/img_3.png'),
                                height: 120.0,
                                width: 120.0,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Select one of the options given below to reset your password.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Column(
                              children: [
                                RadioListTile<String>(
                                    value: "email",
                                    groupValue: ChooseSendCubit.get(context).type,
                                    title: Text(
                                      'Sent Code Via Email ${email}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        fontFamily: 'Mulish',
                                      ),
                                    ),
                                    // tileColor: Colors.deepPurple.shade50,
                                    dense: true,
                                    contentPadding: EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50.0)),
                                    onChanged: (value) {
                                      ChooseSendCubit.get(context)
                                          .selectValue(value!);
                                    }
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                RadioListTile<String>(
                                  //content
                                    value: "phone",
                                    groupValue: ChooseSendCubit.get(context).type,
                                    title: Text(
                                      'Sent Code Via SMS ${phone}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        fontFamily: 'Mulish',
                                      ),
                                    ),
                                    //tileColor: Colors.deepPurple.shade50,
                                    dense: true,
                                    contentPadding: EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50.0)),
                                    onChanged:
                                        (value) {
                                          ChooseSendCubit.get(context)
                                              .selectValue(value!);
                                    }
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: default_Button(
                                function: () {
                                 if(ChooseSendCubit.get(context).type == "email")
                                 {
                                   ChooseSendCubit.get(context).SendOTP_To_Email(email: '${email}');
                                 }else{
                                   ChooseSendCubit.get(context).SendOTP_To_Phone(phone: '${phone}');
                                 }
                                },
                                text: 'Continue',
                                isUpperCase: false,
                                textStyle: null,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            default_Button(
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FindAcount(),
                                  ),
                                );
                              },
                              text: 'Not You?',
                              backgroundcolor: const Color(0xFFB6B7B7),
                              textStyle: null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
