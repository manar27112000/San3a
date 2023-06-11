import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:san3a/models/chat_model.dart';
import 'package:san3a/models/message_model.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_state.dart';
import 'package:san3a/modules/chat_screen/camera%20page/camera_screen.dart';
import 'package:san3a/modules/chat_screen/camera%20page/camera_veiw.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/own_card_message.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/own_file_card.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/reply_card_message.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/reply_file_card.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class IndividualChat extends StatefulWidget {
  IndividualChat(this.index,  {Key? key}) : super(key: key);
   late int index;
  @override
  State<IndividualChat> createState() =>
      _IndividualChatState( this.index );
}

class _IndividualChatState extends State<IndividualChat> {
  bool sendButton = false;
  // final List<MessageModel> messages = [];
  ScrollController scrollController = ScrollController();
  ImagePicker _Picker = ImagePicker();
  XFile? file;
  int popTime = 0;

  _IndividualChatState( this.index);

  late int index;
 TextEditingController messageController = TextEditingController();
  // IO.Socket? socket;

  // @override
  // void initState() {
  //   connect();
  //   // TODO: implement initState
  //   super.initState();
  // }
  // void connect(){
  //   socket = IO.io("uri",<String,dynamic>{
  //    "transports":["websocket"],
  //     "autoConnect":false
  //   });
  //   socket!.connect();
  //   socket!.emit("signin", widget.sourchat!.id);
  //   socket!.onConnect((data) {
  //   print("connected");
  //     socket!.on('message',(msg){
  // print(msg);
  // setMessage("destionation",msg["message"],msg["path"]);
  // scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  // });
  //   });
  //   print(socket!.connected);
  //
  // }
  //
  // void sendMessage(String message , int sourceId , int targetId, String path){
  // setMessage("source",message ,path);
  //   socket!.emit("message" , {"message ":message,"sourceId":sourceId ,"targetId":targetId ,"path":path});
  // }
  // void setMessage (String type , String message , String path){
  //   MessageModel messageModel=MessageModel(type: type , message:message,path:path , time: DateTime.now().toString().substringg(10 , 16));
  //     setState(() {
  //       messages.add(messageModel);
  //   });
  // }
  // void onImageSend(String path , String message)async{
  //   print('hey there working $message');
  //   for(int i=0 ;i<popTime;i++){
  //     Navigator.pop(context);
  //   }
  //   setState(() {
  //     popTime=0;
  //   });
  //
  //   var request = http.MultipartRequest("POST",Uri.parse("http:"));
  //   request.files.add(await http.MultipartFile.fromPath("img",path));
  //   request.headers.addAll({
  //     "Content-type": "multipart/form-data"
  //   });
  //   http.StreamedResponse response = await request.send();
  //   var httpResponse = await http.Response.fromStream(response);
  //   var data=json.decode(httpResponse.body);
  //   print(data["path"]);
  //   setMessage("source",message ,path);
  //   socket!.emit("message" , {"message ":message,"sourceId":widget.sourchat!.id ,"targetId": widget.chatModel!.id,"path":data["path"]});
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if( state is MessageSuccessState){
        }
      },
      builder: (context, state) {
        var Cubit = ChatCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 75,
            leading: InkWell(
              onTap: () {
                Cubit.GetAllChats(token: token!);
                Navigator.pop(context);

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if(Cubit.chatModel!.data![index].to!.id ==  Cubit.chatModel!.loginId)
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage('${Cubit.chatModel!.data![index].from!.photo}'),
                  ),
                  if(Cubit.chatModel!.data![index].to!.id !=  Cubit.chatModel!.loginId)
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                      NetworkImage('${Cubit.chatModel!.data![index].to!.photo}'),
                    )
                ],
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(Cubit.chatModel!.data![index].to!.id ==  Cubit.chatModel!.loginId)
                  Text(
                    '${Cubit.chatModel!.data![index].from!.name}',
                    style: const TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                if(Cubit.chatModel!.data![index].to!.id !=  Cubit.chatModel!.loginId)
                  Text(
                    '${Cubit.chatModel!.data![index].to!.name}',
                    style: const TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                const Text(
                  'last seen today at 12:30',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
            actions: [
              PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: "View Profile",
                        child: Text("View Profile"),
                      ),
                      const PopupMenuItem(
                        value: "Media,links,and docs",
                        child: Text("Media,links,and docs"),
                      ),
                      const PopupMenuItem(
                        value: "Mute Notification",
                        child: Text("Mute Notification"),
                      ),
                    ];
                  }),
            ],
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                    child: ConditionalBuilder(
                        condition:state is MessageSuccessState,
                        builder: (context){
                          return ListView.builder(
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              if (index == Cubit.messageModel!.data!.length) {
                                return Container(
                                  height: 70,
                                );
                              }
                              if (Cubit.messageModel!.data![index].sender == Cubit.chatModel!.loginId) {
                                if (Cubit.messageModel!.data![index].image != null) {
                                  return OwnFileCard(Cubit.messageModel , index);
                                } else {
                                  return OwnMessageCard(Cubit.messageModel , index);
                                }
                              }
                              else {
                                if (Cubit.messageModel!.data![index].image != null) {
                                  return ReplyFileCard(Cubit.messageModel,index);
                                } else {
                                  return ReplyMessageCard(Cubit.messageModel,index);
                                }
                              }
                            },
                            itemCount: Cubit.messageModel!.data!.length  ,
                          );
                        },
                        fallback: (context )=>Center(child: CircularProgressIndicator())
                    ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 60,
                          height: 50,
                          child: Card(
                              margin: const EdgeInsets.only(
                                  left: 2, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                controller: messageController,
                                maxLines: 3,
                                minLines: 1,
                                onChanged: (value) {
                                  if (value.length > 0) {
                                    setState(() {
                                      sendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a Message",
                                    hintStyle: const TextStyle(fontSize: 15),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          child: IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomSheet());
                                            },
                                            icon: const Icon(Icons.attach_file),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                popTime = 2;
                                              });
                                              navigateTo(
                                                  context,
                                                  const CameraScreen(
                                                      // onImageSend: onImageSend
                                                      ));
                                            },
                                            icon: const Icon(Icons.camera_alt),
                                          ),
                                        ),
                                      ],
                                    ),
                                    contentPadding:
                                        const EdgeInsetsDirectional.only(
                                            start: 20, end: 20)),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, right: 5, left: 2),
                          child: CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              onPressed: () {
                                if (sendButton) {
                                  scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                       Cubit.PostMessageChats(token: token!, index: index, content: messageController.text);
                                      // messageController.clear();
                                  setState(() {
                                    sendButton = false;
                                  });
                                }
                              },
                              icon: Icon(sendButton ? Icons.send : Icons.mic),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget attach(Function() function, IconData icon, Color color, String text) {
    return InkWell(
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: IconButton(
                  onPressed: function,
                  icon: Icon(icon, size: 29, color: Colors.white))

              // ,

              ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  attach(() {}, Icons.insert_drive_file, Colors.indigo,
                      'Document'),
                  const SizedBox(
                    width: 40.0,
                  ),
                  attach(() {
                    setState(() {
                      popTime = 3;
                    });
                    navigateTo(
                        context,
                        const CameraScreen(
                            // onImageSend: onImageSend
                            ));
                  }, Icons.camera_alt, Colors.pink, 'Camera'),
                  const SizedBox(
                    width: 40.0,
                  ),
                  attach(() async {
                    // XFile? file = await _Picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      popTime = 2;
                    });
                    XFile? file =
                        await _Picker.pickImage(source: ImageSource.gallery);
                    // navigateTo(context, CameraViewPage(path: file!.path,onImageSend: onImageSend,));
                  }, Icons.insert_photo, Colors.purple, 'Photo'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  attach(() {}, Icons.headset, Colors.orange, 'Audio'),
                  const SizedBox(
                    width: 40.0,
                  ),
                  attach(() {}, Icons.location_pin, Colors.teal, 'Location'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
