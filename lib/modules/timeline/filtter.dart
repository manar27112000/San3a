

import 'package:flutter/material.dart';
import 'package:san3a/modules/timeline/states.dart';
import 'package:san3a/shared/component/component.dart';

class Filter extends StatefulWidget {
   Filter ({Key? key}) : super(key: key);
  List<String> items = ["Car", "Bus", "Train", "Aeroplane"];
  String currentItem = "";

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
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
    return   Drawer(
      width: double.infinity / 2,
        child: ListView(
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
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)
              ],),
            ),
            const SizedBox(height: 5,),
            myDivider(),
            const Text('Category',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            myDivider(),
            Column(
              children: [
                ...category.map(checkbox).toList(),
                TextButton(

                  onPressed: () {  },
                  child: const Text(
                    "See More",
                    style: TextStyle(fontSize: 16,color: Colors.red),
                  ),),

              ],),

            myDivider(),
            const Text('Location',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            myDivider(),
            Column(
              children: [
                ...location.map(checkbox).toList(),
                TextButton(

                  onPressed: () {  },
                  child: const Text(
                    "See More",
                    style: TextStyle(fontSize: 16,color: Colors.red),
                  ),),
              ],),
          ],

        )
      ],
    )

    );
  }
  Widget checkbox(CheckBoxState checkBox)=> CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: Colors.red,
    title:  Text(checkBox.title,style: const TextStyle(fontSize: 20),),
    value: checkBox.value, onChanged: (value)=>setState(() =>checkBox.value=value!),

  );

}














//
// class Filter extends StatelessWidget {
//    Filter({Key? key}) : super(key: key);
//   List<String> items = ["Car", "Bus", "Train", "Aeroplane"];
//    String currentItem = "";
//
//   bool value = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Drawer(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(children: [
//               AppBarIcons(icon:Icons.arrow_back_ios_rounded , function: (){
//               Navigator.pop(context);
//               }),
//               SizedBox(height: 5,)
//              , const Text("Filter",textAlign: TextAlign.center ,
//                 style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)
//             ],),
//           ),
//           SizedBox(height: 5,),
//           mDivider(),
//
//               ListView(
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(value: value, onChanged: (value)=>),
//                     ],
//                   )
//                 ],
//               )
//
//
//
//         ],
//       ),
//
//
//     );
//   }
// }
