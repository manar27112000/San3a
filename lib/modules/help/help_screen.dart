import 'package:flutter/material.dart';
import 'package:san3a/shared/component/applocal.dart';
import 'package:san3a/shared/component/component.dart';



class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child:  Text('${getLang(context,"Help")}')),
        actions: const [
          // AppBarIcons( icon: Icons.wechat, function: () {  },),
          // AppBarIcons( icon: Icons.menu, function: () {  },),
        ],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:   [
              Container(
                height: 120,width: 120,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://static4.depositphotos.com/1000393/362/i/600/depositphotos_3628253-stock-photo-smiling-manual-worker.jpg'),
                        fit: BoxFit.cover)),
              ),
              TextFeild_(icon:Icons.person,
                text: '${getLang(context,"UserName")}',
                maxLine: 1,
                maxLength: 30,
                keyboardType:TextInputType.name ,),
              TextFeild_(icon:Icons.person,
                text: '${getLang(context,"EmailAddress")}',
                maxLine: 1,
                maxLength:40,
                keyboardType:TextInputType.emailAddress ,),
              TextFeild_(
                text:'${getLang(context,"whatistheproblem")}',
                keyboardType:TextInputType.multiline,
                maxLine: null ,
                maxLength: 200,
                minLine: 10, icon: null,),
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15),


                ),
                child:   MaterialButton(

                    onPressed: (){},
                    child: Row(

                      children:  [


                        SizedBox(width: 10.0,),
                        Text('${getLang(context,"Submit")}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
