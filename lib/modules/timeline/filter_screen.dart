import 'package:flutter/material.dart';
import 'package:san3a/modules/timeline/states.dart';

import '../../shared/component/component.dart';

class Filter_screen extends StatefulWidget {
  const Filter_screen({Key? key}) : super(key: key);

  @override
  State<Filter_screen> createState() => _Filter_screenState();
}

class _Filter_screenState extends State<Filter_screen> {
  bool value = false;
  final category=[
    CheckBoxState(title: 'Ahmed'),
    CheckBoxState(title: 'Manar'),
    CheckBoxState(title: 'Mohamed'),
    CheckBoxState(title: 'Sohaila'),
    CheckBoxState(title: 'Farouk'),

  ];
  final location=[
    CheckBoxState(title: 'cairo'),
    CheckBoxState(title: 'giza'),
    CheckBoxState(title: 'ggg'),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.lightBlue,
      body:  ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  AppBarIcons(icon:Icons.arrow_back_ios_rounded , function: (){
                    Navigator.pop(context);
                  }, size: 20,),
                  const SizedBox(height: 5,)
                  , const Text("Filter",textAlign: TextAlign.center ,
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),)
                ],),
              ),
              const SizedBox(height: 5,),
              myDivider(),
              const Text('Category',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),),
              myDivider(),
              Column(
                children: [
                  ...category.map(checkbox).toList(),
                  TextButton(

                    onPressed: () {  },
                    child: const Text(
                      "See More",
                      style: TextStyle(fontSize: 16,color: Colors.black),
                    ),),

                ],),

              myDivider(),
              const Text('Location',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              myDivider(),
              Column(
                children: [
                  ...location.map(checkbox).toList(),
                  TextButton(

                    onPressed: () {  },
                    child: const Text(
                      "See More",
                      style: TextStyle(fontSize: 16,color: Colors.black),
                    ),),
                ],),
            ],

          )
        ],
      ),


    );
  }
  Widget checkbox(CheckBoxState checkBox)=> CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: Colors.white,
    title:  Text(checkBox.title,style: const TextStyle(fontSize: 20),),
    value: checkBox.value, onChanged: (value)=>setState((){
    checkBox.value=value!;
    print("checkBox.value=value!=${checkBox.value=value!}");

  }),

  );

}
