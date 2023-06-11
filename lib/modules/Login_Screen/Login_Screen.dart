


import 'package:animated_text_field/animated_text_field.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:san3a/header.dart';
import 'package:san3a/layout/san3a_layout.dart';

import 'package:san3a/modules/Login_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/Login_Screen/Cubit/states.dart';
import 'package:san3a/modules/Register_Screen/SignUp_Screen1.dart';
import 'package:san3a/modules/rereset/findaccount/FindAcount.dart';
import 'package:san3a/modules/timeline/timeline_worker/Drawar.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

import 'package:san3a/shared/network/local/cache_helper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Login_Screen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();
  double _headerHeight = 250;

  var  emailController = TextEditingController();

  var  passwordController = TextEditingController();

  bool Showpass = true;

  Login_Screen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, AppLoginStates>(
      listener: (context, state){
        if (state is LoginSuccessState) {
          if (state.loginModel!.status) {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel!.token,
            ).then((value) {
              token = state.loginModel!.token!;

              navigateAndFinish(context,  DrawerScreen());
              showToast(
                  text: state.loginModel!.message,
                  state: ToastState.SUCCESS);
            });
          }

        } else if(state is LoginErrorState){
          showToast(
            text: state.error.toString(),
            state: ToastState.ERORR,
          );
        }

      },
      builder: (context, state)
      {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  FadeAnimation(1, Container
                    (height: 250,
                    child: FadeAnimation(1.2,HeaderWidget(_headerHeight, true,  Center(child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('Login',textStyle: TextStyle(fontSize: 35,color: Colors.yellowAccent,fontWeight: FontWeight.bold)),
                      ],
                      isRepeatingAnimation: true,

                    ),),
                    )), //let's create a common header widget
                  ),),
                  SafeArea(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                        // This will be the login form
                        child: Column(
                          children: [
                            // Text("Email",textAlign:TextAlign.left,),
                            FadeAnimation(1.3,  TextFormField(
                              controller: emailController,
                              onFieldSubmitted: (evalue) {

                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                // hintText: 'Email Adress',
                                icon: Icon(Icons.email),
                                labelText: 'Email Adress',
                                // border: UnderlineInputBorder(
                                //    ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty ) {
                                  return 'email adress must not be empty';
                                }else{
                                  return null;
                                }
                              },
                            )),
                            const SizedBox(height: 10.0),
                            FadeAnimation(1.4,  TextFormField(
                              controller: passwordController,
                              onFieldSubmitted: (value){
                                if(formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              //suffixPressed : (){},
                              obscureText: LoginCubit.get(context).isPassword,
                              decoration: InputDecoration(
                                // hintText: 'Password',
                                icon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    LoginCubit.get(context).ChangePasswordVisibilit();
                                  },
                                  icon: Icon(LoginCubit.get(context).suffix),
                                ),
                                labelText: 'Password',

                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not be empty and must more than 8';
                                }
                                // else if(value.length < 8){
                                //   return 'password must more than 8 characters';
                                // }
                                else{
                                  return null;
                                }
                              },
                            )),
                            const SizedBox(height: 15.0),
                            FadeAnimation(1.5,  Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FindAcount(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Forgot your password?",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    //const Color(0xff4377ec),
                                  ),
                                ),
                              ),
                            )),
                            const SizedBox(height: 15.0),
                            //AhmedShaaban@gmail.com
                            FadeAnimation(1.6, ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) =>
                                  default_Button(
                                    function: () {
                                      if(formKey.currentState!.validate()) {
                                        // print(emailController.text);
                                        // print(passwordController.text);
                                        LoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text
                                        );
                                      }
                                    },
                                    text: 'Login',
                                    isUpperCase: false,
                                    textStyle: null,
                                  ),
                              fallback: (context) => const Center(child: CircularProgressIndicator()),
                            )),
                            const SizedBox(height: 15.0),
                            FadeAnimation(1.7,  Text('or login with',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            )),
                            const SizedBox(height: 15.0),
                            FadeAnimation(1.8,  Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  socialButtonCircle(

                                    const Color(0xffDF4A32), FontAwesomeIcons.google,
                                    iconColor: Colors.white,

                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  socialButtonCircle(
                                    const Color(0xff39579A), FontAwesomeIcons.facebookF,
                                    iconColor: Colors.white,

                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(height: 10.0),
                            FadeAnimation(1.9,  Container(
                              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text.rich(
                                  TextSpan(
                                      children: [
                                        const TextSpan(text: "Don't have an account? "),
                                        TextSpan(
                                          text: 'Sign up',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => SignUp_Screen(),

                                                  ),(route)=>false
                                              );
                                            },
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,),
                                        ),
                                      ])),
                            )),
                          ],
                        )),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
