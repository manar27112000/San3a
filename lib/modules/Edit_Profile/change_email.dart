import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:san3a/shared/component/component.dart';

import '../../animation.dart';
import '../../header.dart';

class Email_Edit extends StatelessWidget {
   Email_Edit({Key? key}) : super(key: key);

   var old_emailcontroller = TextEditingController();
   var new_emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(text: 'Change Your Email ', func1: () {  }, func2: () {  }),
      body: SingleChildScrollView(
        child: Center(
          child : Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Change Your Email Address',
                //   style: TextStyle(
                //     fontSize: 30.0,
                //     fontWeight: FontWeight.bold,
                //     //color: Colors.blue,
                //   ),
                // ),
                SizedBox(height: 40,),
                FadeAnimation(1.1, default_tTextFormField(
                  controller: old_emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Enter old Email Address',
                  prefix: Icons.email,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email Number must not be empty';
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                )),
                SizedBox(height: 15.0,),
               FadeAnimation(1.2,  default_tTextFormField(
                 controller: new_emailcontroller,
                 keyboardType: TextInputType.emailAddress,
                 labelText: 'Enter new Email Address',
                 prefix: Icons.email,
                 validate: (String? value) {
                   if (value!.isEmpty) {
                     return 'Email must not be empty';
                   }
                 },
                 onFieldSubmitted: (value) {
                   print(value);
                 },
               )),
                SizedBox(height: 25.0,),
               FadeAnimation(1.3,  AnimatedButton(
                 height: 40,
                 width: double.infinity,
                 text: 'next',
                 textStyle: TextStyle(color: Colors.black,fontSize: 20),
                 isReverse: true,
                 selectedTextColor: Colors.black,
                 transitionType: TransitionType.LEFT_TO_RIGHT,

                 backgroundColor: Colors.yellowAccent,
                 borderColor: Colors.yellowAccent,
                 borderRadius: 50,
                 borderWidth: 1,
                 onPress: () {
                 },
               )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
