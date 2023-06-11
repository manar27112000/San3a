import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:san3a/modules/add_post_screen/cubit/post_states.dart';

class PostCubit extends Cubit<PostStates>{
  PostCubit():super(PostInitialState());

  static PostCubit get(context)=> BlocProvider.of(context) ;

  bool isPost = false ;
  Color ColorButton =  Colors.grey;
  void changeColorButton(bool isPost){

      if(isPost== true){
        ColorButton=Colors.blue;
        emit(PostChangeColorButtonState());
      }
      else {
        ColorButton=Colors.grey;
        emit(PostChangeColorButtonState());
      }

  }
}