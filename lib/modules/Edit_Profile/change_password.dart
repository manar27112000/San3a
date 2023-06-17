import 'package:flutter/material.dart';
import 'package:san3a/shared/component/applocal.dart';
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
                  child: Text('${getLang(context,"ChangeYourPassword")}',//${getLang(context,"ChangeYourPassword")}
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
                  labelText: '${getLang(context,"EnterYouroldpassword")}',//${getLang(context,"EnterYouroldpassword")}
                  prefix: Icons.lock,
                  suffix: Icons.visibility_off_outlined,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return '${getLang(context,"password mustnotbeempty")}';//${getLang(context,"password mustnotbeempty")}
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
                  labelText: '${getLang(context,"EnterYournewpassword")}',//${getLang(context,"EnterYournewpassword")}
                  prefix: Icons.lock,
                  suffix: Icons.visibility_off_outlined,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return '${getLang(context,"passwordmustnotbeempty")}';//${getLang(context,"passwordmustnotbeempty")}
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
                  labelText: '${getLang(context,"ConfirmnewPassword")}',//${getLang(context,"ConfirmnewPassword")}
                  prefix: Icons.lock,
                  suffix: Icons.visibility_off_outlined,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return '${getLang(context,"passwordmustnotbeempty")}y';//${getLang(context,"passwordmustnotbeempty")}
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 15.0,),
                default_Button(
                  text: '${getLang(context,"ChangeYourPassword")}',//${getLang(context,"ChangeYourPassword")}
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
