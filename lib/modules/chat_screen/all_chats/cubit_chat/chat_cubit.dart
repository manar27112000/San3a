import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/chat_model.dart';

import 'package:san3a/models/message_model.dart';
import 'package:san3a/models/send_message.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_state.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class ChatCubit extends Cubit<ChatState>{
  ChatCubit():super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);
  ChatModel? chatModel;

  MessageModel? messageModel;
  SendMessage? sendMessage;
  void GetAllChats({required String token}) {
    emit(ChatLoadingState());
    print(token);
    DioHelper.getData(
        url: GETALLCHATS,
        token: token
    ).then((value) {
      chatModel = ChatModel.fromJson(value.data);

      emit(ChatSuccessState(chatModel ));
    }).catchError((error) {
      emit(ChatErrorState(error.toString()));
    });
  }


  void GetMessageChats({required int index}) {
    emit(MessageLoadingState());
    DioHelper.postData(
        url: GETALLMESSAGE,
        token: token,
        data: {
          'chatId': chatModel!.data![index].sId})
        .then((value) {
      messageModel= MessageModel.fromJson(value.data);

      emit(MessageSuccessState());
    }).catchError((error){
      emit(MessageErrorState(error.toString()));
      print(error.toString());


    });
  }

  void PostMessageChats({required String token,required int index , required String content}) {
    print(content.toString());
    DioHelper.postData(
        url: SENDMESSAGE,
        token: token,
        data: {
          'text': content,
          'chatId': chatModel!.data![index].sId})
        .then((value) {
          print(content.toString());
      sendMessage= SendMessage.fromJson(value.data);
          // print(sendMessage!.data!.content);
      emit(SendSuccessState(sendMessage));
    }).catchError((error){
      emit(SendErrorState(error.toString()));
      print(error.toString());


    });
  }


  Future<void> GetChatsFromPost({ required String idUser}) async {
    emit(MessageLoadingState());
    DioHelper.postData(
        url: GETMESSAGEFromPost,
        token: token,
        data: {
          'id':idUser })
        .then((value) {
      messageModel= MessageModel.fromJson(value.data);
      print(messageModel!.message);

      print(messageModel!.data![0].text);
      emit(MessageSuccessState());
    }).catchError((error){
      emit(MessageErrorState(error.toString()));
      print(error.toString());


    });
  }

}