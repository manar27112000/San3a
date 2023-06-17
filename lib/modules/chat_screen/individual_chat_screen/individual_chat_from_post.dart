
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:san3a/models/message_model.dart';
import 'package:san3a/models/message_socket_model.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_state.dart';
import 'package:san3a/modules/chat_screen/camera%20page/camera_screen.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/own_card_message.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/own_file_card.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/reply_card_message.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/reply_file_card.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class IndividualChatFromPost extends StatefulWidget {
  IndividualChatFromPost(this.index, this.model, {Key? key}) : super(key: key);
  late int index;
  PostModel? model;
  late  String chatId;
  @override
  State<IndividualChatFromPost> createState() =>
      _IndividualChatFromPostState( this.chatId,this.index ,this.model );
}

class _IndividualChatFromPostState extends State<IndividualChatFromPost> {
  bool sendButton = false;
  bool isSocket= false;
  ScrollController scrollController = ScrollController();
  ImagePicker _Picker = ImagePicker();
  XFile? file;
  int popTime = 0;
  _IndividualChatFromPostState(this.chatId, this.index ,this.model);
  PostModel? model;
  late int index;
  late  String chatId;
  MessageSocketModel? messageSocketModel;
  TextEditingController messageController = TextEditingController();
  IO.Socket? socket;

  @override
  void initState() {
    connect();
    // TODO: implement initState
    super.initState();
  }
  void connect(){
    socket = IO.io("https://san3aapp.onrender.com");
    socket!.on('user list update',(data){
      print('connect');
    } );
    socket!.on('chat message',(data){
      print(data);
      setMessage("receiver",data["content"], data["time"]);
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
  void setMessage (String type , String message,String time ,){
    messageSocketModel=MessageSocketModel(type: type , message:message, time: time);
    setState(() {

    });
  }
  void sendMessage(String message ){
    socket!.emit("chat message" , {"content":message,"chat":chatId , "time":DateTime.now().toString().substring(10 , 16)});
    setMessage("sender",message ,DateTime.now().toString().substring(10 , 16));
    print(message);
    print(chatId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {

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
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                        NetworkImage('${model!.postData[index].userDataPost.photo}'),
                    ),

                ],
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    '${model!.postData[index].userDataPost.name}',
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
                      condition:state is MessageSuccessState ,
                      builder: (context){
                        return ListView.builder(
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            if (index == Cubit.messageModel!.data!.length) {
                              return Container(
                                height: 70,
                              );
                            }
                            if(isSocket){
                              if (Cubit.messageModel!.data![index].sender == Cubit.chatModel!.loginId || messageSocketModel!.type == 'sender') {
                                if (Cubit.messageModel!.data![index].image != null) {

                                  return OwnFileCard(Cubit.messageModel , index);
                                }
                                else {
                                  return OwnMessageSocketCard( messageSocketModel);
                                }
                              }
                              else {
                                if (Cubit.messageModel!.data![index].image != null) {
                                  return ReplyFileCard(Cubit.messageModel,index);
                                } else {
                                  return ReplyMessageSocketCard(messageSocketModel);
                                }
                              }
                            }
                            else{
                              if (Cubit.messageModel!.data![index].sender == Cubit.chatModel!.loginId) {
                                if (Cubit.messageModel!.data![index].image != null) {

                                  return OwnFileCard(Cubit.messageModel , index);
                                } else {

                                  return OwnMessageCard(Cubit.messageModel ,index);
                                }
                              }
                              else {
                                if (Cubit.messageModel!.data![index].image != null) {
                                  return ReplyFileCard(Cubit.messageModel,index);
                                } else {
                                  return ReplyMessageCard(Cubit.messageModel ,index);
                                }
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
                                  Cubit.PostMessageFromPost( content: messageController.text);
                                   messageController.clear();
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

  Widget OwnMessageSocketCard(MessageSocketModel? messageSocketModel ){
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width-225,
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Container(
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Color(0xffdcf8c6),
            margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 60,top: 10,bottom: 20),

                  child: Text('${messageSocketModel!.message}',style: TextStyle(fontSize: 16),) ,
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(children: [
                    Text('${messageSocketModel.time}',style: TextStyle(fontSize: 13,color: Colors.grey[600]),) ,
                    SizedBox(width: 5,),
                    Icon(Icons.done_all,size: 20,),
                  ],),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget ReplyMessageSocketCard(MessageSocketModel? messageSocketModel ){
    return   Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffE9EBECFF),
          margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 5),
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10,right: 60,top: 10,bottom: 20),
                  child:  Text('${messageSocketModel!.message}',style: TextStyle(fontSize: 16),) ) ,

              Positioned(
                bottom: 4,
                right: 10,
                child: Text('${messageSocketModel.time}',style: TextStyle(fontSize: 13,color: Colors.grey[600]),),

              )
            ],
          ),
        ),
      ),
    );
  }

  Widget OwnMessageCard(MessagesModel? messageModel , index ){
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width-225,
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Container(
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Color(0xffdcf8c6),
            margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 60,top: 10,bottom: 20),

                  child: Text('${messageModel!.data![index].text}',style: TextStyle(fontSize: 16),) ,
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(children: [
                    Text('${messageModel.data![index].time}',style: TextStyle(fontSize: 13,color: Colors.grey[600]),) ,
                    SizedBox(width: 5,),
                    Icon(Icons.done_all,size: 20,),
                  ],),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget ReplyMessageCard(MessagesModel? messageModel ,index){
    return   Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffE9EBECFF),
          margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 5),
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10,right: 60,top: 10,bottom: 20),
                  child:  Text('${messageModel!.data![index].text}',style: TextStyle(fontSize: 16),) ) ,

              Positioned(
                bottom: 4,
                right: 10,
                child: Text('${messageModel.data![index].text}',style: TextStyle(fontSize: 13,color: Colors.grey[600]),),

              )
            ],
          ),
        ),
      ),
    );
  }
}
