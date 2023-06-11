
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/rereset/Choose_send/choose_send%20.dart';
import 'package:san3a/modules/rereset/findaccount/Cubit/FindAccount_cubit.dart';
import 'package:san3a/modules/rereset/findaccount/Cubit/FindAccount_states.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';



class FindAcount extends StatelessWidget {

  final formKey = GlobalKey<FormState>();

  var Email_Controller = TextEditingController();
  var phone_Controller = TextEditingController();

  var conpasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchAccountCubit(),
      child: BlocConsumer<SearchAccountCubit, SearchAccountStates>(
        listener: (context, state) async {
          final cubit = context.read<SearchAccountCubit>();
         // await cubit.getEmailPhone();
          if (state is FindAccountSuccessState) {
            if (state.SearchModel!.status) {
              print(state.SearchModel!.message);
              final email = state.SearchModel!.data!.email;
              final phone = state.SearchModel!.data!.phone;
              print(email);
              print(phone);
              navigateAndFinish(context, choose_send(email: email, phone: phone));
              showToast(
                  text: state.SearchModel!.message,
                  state: ToastState.SUCCESS);
            } else {
              print(state.SearchModel!.message);
              showToast(
                text: state.SearchModel!.message,
                state: ToastState.ERORR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SafeArea(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
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
                                  'Find Your Account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: Email_Controller,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              keyboardType: TextInputType.emailAddress,
                              //obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                labelText: 'Enter Your Email',
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50))),
                              ),
                              validator:  (value) {
                                if (value!.isEmpty) {
                                  return 'email adress must not be empty';
                                }else{
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              child: ConditionalBuilder(
                                condition: state is! FindAccountLoadingState,
                                builder: (context) =>
                                    default_Button(
                                      function: () {
                                        if(formKey.currentState!.validate()) {
                                          // final cubit = context.read<SearchAccountCubit>();
                                          // final email = Email_Controller.text;
                                          // final phone = phone_Controller.text;
                                          // cubit.searchAccount(email, phone);
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => choose_send(),
                                          //   ),
                                          // );
                                          SearchAccountCubit.get(context).SearchAccount(email: Email_Controller.text);
                                        }
                                      },
                                      text: 'search',
                                      isUpperCase: false,
                                      textStyle: null,
                                    ),
                                fallback: (context) => Center(child: CircularProgressIndicator()),
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
                                    builder: (context) => Login_Screen(),
                                  ),
                                );
                              },
                              text: 'Cancel',
                              textStyle: Colors.black,
                              backgroundcolor: const Color(0xFFB6B7B7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// SingleChildScrollView(
// child: Column(
// children: [
// SafeArea(
// child: Container(
// padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
// child: Column(
// children: [
// Column(
// children: [
// Container(
// child: Image(
// image: AssetImage('assets/images/img_3.png'),
// height: 120.0,
// width: 120.0,
// ),
// ),
// SizedBox(
// height: 15.0,
// ),
// Text(
// 'Find Your Account',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 30.0,
// color:  Colors.black,
// ),
// ),
// SizedBox(height: 20.0,),
// ],
// ),
// TextFormField(
// controller: Email_Controller,
// onFieldSubmitted: (value) {
// print(value);
// },
// keyboardType: TextInputType.emailAddress,
// //obscureText: true,
// decoration: InputDecoration(
// prefixIcon: Icon(Icons.search),
// labelText: 'Enter Your Email',
// border: OutlineInputBorder(
// borderRadius:
// const BorderRadius.all(Radius.circular(50))),
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// default_Button(
// function: () {
// // String email = Email_Controller.text;
// // context.read<EmailSearchCubit>().search(email);
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => const forget_1(),
// ),
// );
// },
// text: 'Search',
// textStyle: null,
// ),
// SizedBox(
// height: 10.0,
// ),
// default_Button(
// function: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => Login_Screen(),
// ),
// );
// },
// text: 'Cancel',
// textStyle : Colors.black,
// backgroundcolor: const Color(0xFFB6B7B7),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
