import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/add_post_screen/cubit/post_cubit.dart';
import 'package:san3a/modules/add_post_screen/cubit/post_states.dart';
import 'package:san3a/shared/component/component.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key,}) : super(key: key);
  @override
  State<AddScreen> createState() => _AddScreenState();

}

class _AddScreenState extends State<AddScreen> {
  String valueChooose = 'elSan3a' ;
  TextEditingController postController= TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool isPost=false ;
@override

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit , PostStates>(
        listener:(context , state){
        },

        builder:(context , state){
          var cubit = PostCubit.get(context);
         return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:const Icon(Icons.arrow_back,color: Colors.black,),),
          title: const Text('Create post',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultButton(
                  background: cubit.ColorButton,
                  text: 'Post',
                  function: (){
                    if (formkey.currentState!.validate()){
                      print(postController);
                      print(isPost);
                    }
                  },
                  width: 90,
                  height:10),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Row(

                  children: [
                    Expanded(

                      flex: 0,
                      child: Column(

                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blueGrey[300],
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                      child: Column(

                        children: [
                          Row(
                            children: const [
                              Text(
                                'Mohamed Ahmed',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    alignment: Alignment(0.5, 0),
                                    menuMaxHeight:120,
                                    style: TextStyle(fontSize: 12,color: Colors.black),
                                    elevation: 0,
                                    value: valueChooose,
                                    borderRadius: BorderRadius.circular(15),
                                    items: const [
                                      DropdownMenuItem<String>( enabled:false,value:'elSan3a' ,child: Text('Choose'),),
                                      DropdownMenuItem<String>(value:'3' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'4' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'5' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'6' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'2' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'8' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'9' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'10' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'11' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'12' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'13' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'14' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'15' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'16' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'17' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'18' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'19' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'20' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'16' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'17' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'18' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'19' ,child: Text('Mechanices'),),
                                      DropdownMenuItem<String>(value:'20' ,child: Text('Mechanices'),),

                                    ],
                                    onChanged: dropDownCallback,
                                  )),
                            ],

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20,),
              Expanded(
                flex: 2,
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                      Container(
                      width: double.infinity,
                      height: 350,
                      child: TextFormField(
                        controller: postController,
                        keyboardType: TextInputType.text,
                        onChanged: (String? value){
                            if(value!.isNotEmpty){
                              isPost=true;
                              cubit.changeColorButton(isPost);
                            }
                            else if(value.isEmpty){
                              isPost=false;
                              cubit.changeColorButton(isPost);
                            }
                          },
                        decoration: InputDecoration(
                            hintText:'Write your post here',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                            border: InputBorder.none,
                      ),
                    ),
                      ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
         }
    );
  }

  void dropDownCallback( String? selectValue){
    if(selectValue is String){
      setState(() {
        valueChooose = selectValue;
      });
    }
  }
}



// defaultTextField(
//     hint: 'Write your post here',
//     type: TextInputType.text,
//     controller: postController,
//    border: InputBorder.none,
//    height: 300,
//
//     // validate:(value){
//     //   if(value!.isEmpty){
//     //     isPost=false;
//     //     cubit.changeColorButton(isPost);
//     //     return 'please enter post';
//     //   }
//     //   else if(value.isNotEmpty){
//     //     isPost=true;
//     //         cubit.changeColorButton(isPost);
//     //   }
//     // }
//     onchange:(String? value){
//       if(value!.isNotEmpty){
//         isPost=true;
//         cubit.changeColorButton(isPost);
//       }
//       else if(value.isEmpty){
//         isPost=false;
//         cubit.changeColorButton(isPost);
//       }
//     }
// ),
