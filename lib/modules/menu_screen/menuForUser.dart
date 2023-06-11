
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/help/help_screen.dart';
import 'package:san3a/modules/pro_woker/pro_worker.dart';
import 'package:san3a/modules/saved_posts/saved_posts.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_worker.dart';
import 'package:san3a/shared/component/component.dart';
import '../Edit_Profile/Edit_profile.dart';

class MenuForUserScreen extends StatefulWidget {
  const MenuForUserScreen({Key? key}) : super(key: key);

  @override
  State<MenuForUserScreen> createState() => _MenuState();
}

class _MenuState extends State<MenuForUserScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      height: 100.0,
                      width: 100.0,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a-/AAuE7mChgTiAe-N8ibcM3fB_qvGdl2vQ9jvjYv0iOOjB=s96-c'),
                      )

                  ),

                  const SizedBox(height: 5),
                  Text('mohamed ahmed' ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5),





                  MenuPage(
                    fun: () {
                      navigateTo(context, ProWorker());
                    },
                    color: Colors.orange,
                    icon: Icons.camera_alt_outlined,
                    text: 'Profile',

                  ),
                  myDivider(),
                  MenuPage(
                    fun: () {navigateTo(context, SavedPosts());},
                    color: Colors.blue,
                    icon: Icons.save_outlined,
                    text: 'Saved Posts',

                  ),
                  // myDivider(),
                  // MenuPage(
                  //   color: Colors.pink,
                  //   icon: Icons.payments_outlined,
                  //   text: 'Payment', fun: () {  },
                  // ),
                  myDivider(),
                  MenuPage(
                    color: Colors.purple,
                    icon: Icons.edit_note_outlined,
                    text: 'Edit Profile', fun: () {navigateTo(context, Edit_profile());  },
                  ),
                  myDivider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.dark_mode_outlined,
                          size: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Dark Mode',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: FlutterSwitch(
                            width: 50.0,
                            height: 25.0,
                            toggleSize: 20.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 1.0,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),

                          child: Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: IconButton(
                              icon: Icon(Icons.language),
                              onPressed: (){  showDialog(

                                  context: context,
                                  builder: (context)
                                  {return BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 6,sigmaY: 6),
                                    child:AlertDialog(
                                      insetPadding: EdgeInsets.all(10),

                                      content: const Text(""),

                                      title: const Text(" Change Language"),

                                      actions: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(14),
                                          child: Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                  },
                                                  child: const Text("Arabic")),
                                              const Spacer(),
                                              TextButton(
                                                  onPressed: () {

                                                  },
                                                  child: const Text("English")),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );}
                              ); },
                            )
                        ),
                      ],
                    ),
                  ),
                  myDivider(),
                  MenuPage(
                    color: Colors.teal,
                    icon: Icons.help_outline_outlined,
                    text: 'Help', fun: () { navigateTo(context, HelpScreen()); },
                  ),
                  myDivider(),
                  MenuPage(
                    color: Colors.red,
                    icon: Icons.logout,
                    text: 'LogOut',
                    fun: () {showDialog(context: context,
                        builder:(BuildContext context){
                          return BackdropFilter(filter: ImageFilter.blur(sigmaY: 6,
                              sigmaX: 6),
                            child: AlertDialog(

                              title: Row(
                                children: const [
                                  Text("Log Out"),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Icon(Icons.logout,size: 20,)
                                ],
                              ),
                              content: const Text("Are you sure ?"),
                              actions: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("No")),
                                      const Spacer(),
                                      TextButton(
                                          onPressed: () {
                                            navigateTo(context,
                                                const TimeLineForWorker());
                                          },
                                          child: const Text("Yes")),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ); },

                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
