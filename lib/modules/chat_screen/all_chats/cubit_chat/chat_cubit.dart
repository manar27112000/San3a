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

  MessagesModel? messageModel;
  SendMessage? sendMessage;
  void GetAllChats({required String token}) {
    emit(ChatLoadingState());
    print(token);
    DioHelper.getData(
        url: GETALLCHATS,
        token: token
    ).then((value) {
      chatModel = ChatModel.fromJson(value.data);
      print(chatModel.toString());
      emit(ChatSuccessState(chatModel ));
    }).catchError((error) {
      emit(ChatErrorState(error.toString()));
    });
  }


  Future<void> GetMessageChats({required int index}) async{
    emit(MessageLoadingState());
    DioHelper.postData(
        url: GETALLMESSAGE,
        token: token,
        data: {
          'chatId': chatModel!.data![index].sId})
        .then((value) {
      messageModel= MessagesModel.fromJson(value.data);

      emit(MessageSuccessState(messageModel));
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
      sendMessage= SendMessage.fromJson(value.data);

    }).catchError((error){
      emit(SendErrorState(error.toString()));
    });
  }

  void PostMessageFromPost({ required String content}) {
    print(content.toString());
    print(messageModel!.chatID);

    DioHelper.postData(
        url: SENDMESSAGE,
        token: token,
        data: {
          'text': content,
          'chatId': messageModel!.chatID})
        .then((value) {
      sendMessage= SendMessage.fromJson(value.data);
    }).catchError((error){
      emit(SendErrorState(error.toString()));
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
      messageModel= MessagesModel.fromJson(value.data);
      print(messageModel!.message);

      emit(MessageSuccessState(messageModel));
    }).catchError((error){
      emit(MessageErrorState(error.toString()));
      print(error.toString());

    });
  }

}