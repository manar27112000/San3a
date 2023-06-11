import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:san3a/modules/Edit_Profile/change_email.dart';
import 'package:san3a/modules/Edit_Profile/change_password.dart';
import 'package:san3a/modules/Edit_Profile/change_phone.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_worker.dart';
import 'package:san3a/shared/component/component.dart';

class Edit_profile extends StatelessWidget {
  const Edit_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            EditProfile(

              text: 'Change Email',
              fun: () {navigateTo(context, Email_Edit());},

            ), const SizedBox(height: 15.0,),
            EditProfile(

              text: 'Change Password',
              fun: () {navigateTo(context, Password_Edit());},

            ), const SizedBox(height: 15.0,),
            EditProfile(

              text: 'Change Phone',
              fun: () {navigateTo(context, change_phone());},

            ), const SizedBox(height: 15.0,),


          ],
        ),
      ),
    );
  }
}
