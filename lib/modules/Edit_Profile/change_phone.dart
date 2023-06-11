import 'package:flutter/material.dart';
import 'package:san3a/shared/component/component.dart';

class change_phone extends StatelessWidget {
   change_phone({Key? key}) : super(key: key);


  var old_phonecontroller = TextEditingController();
  var new_phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child : Column(
              children: [
                Text('Change Your Phone Number',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  //color: Colors.blue,
                ),
                ),
              default_tTextFormField(
                  controller: old_phonecontroller,
                  keyboardType: TextInputType.phone,
                  labelText: 'Enter old Phone Number',
                  prefix: Icons.phone,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Phone Number must not be empty';
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 15.0,),
                default_tTextFormField(
                  controller: new_phonecontroller,
                  keyboardType: TextInputType.phone,
                  labelText: 'Enter new Phone Number',
                  prefix: Icons.phone,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Phone Number must not be empty';
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 15.0,),
            default_Button(
              text: 'Change',
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
