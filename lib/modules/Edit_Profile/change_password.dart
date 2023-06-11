import 'package:flutter/material.dart';
import 'package:san3a/shared/component/component.dart';

class Password_Edit extends StatelessWidget {
   Password_Edit({Key? key}) : super(key: key);

  var old_passcontroller = TextEditingController();
  var new_passcontroller = TextEditingController();
  var new_confpasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child : Column(
              children: [
                Center(
                  child: Text('Change Your  Password',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      //color: Colors.blue,
                    ),
                  ),
                ),
                default_tTextFormField(
                  controller: old_passcontroller,
                  keyboardType: TextInputType.number,
                  labelText: 'Enter Your old password',
                  prefix: Icons.lock,
                  suffix: Icons.visibility_off_outlined,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'password must not be empty';
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 15.0,),
                default_tTextFormField(
                  controller: new_passcontroller,
                  keyboardType: TextInputType.number,
                  labelText: 'Enter Your new password',
                  prefix: Icons.lock,
                  suffix: Icons.visibility_off_outlined,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'password must not be empty';
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 15.0,),
                default_tTextFormField(
                  controller: new_confpasscontroller,
                  keyboardType: TextInputType.number,
                  labelText: 'Confirm new Password',
                  prefix: Icons.lock,
                  suffix: Icons.visibility_off_outlined,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password must not be empty';
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 15.0,),
                default_Button(
                  text: 'Change Password',
                  isUpperCase: false,
                  textStyle: null,
                  function: () {

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
