import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onboarding/onboarding.dart';
import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/models/login_model.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/profileModel.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_state.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat_from_post.dart';
import 'package:san3a/modules/pro_send_user/pro_sen_user.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:san3a/shared/styles/colors.dart';
import 'package:san3a/shared/styles/icon_broken.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
PreferredSizeWidget defaultAppBar({
  required String text,
  required Function() func1,
  required Function() func2,
  IconData? icon1,
  IconData? icon2,
}) =>
    AppBar(

      elevation: 0,
      titleSpacing: 20.0,
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,

        ),
      ),
      actions: [
        Row(
          children: [
            IconButton(
                onPressed: func1,
                icon: Icon(
                  icon1,
                  size: 25.0,

                )),
            IconButton(
                onPressed:func2,
                icon: Icon(
                  icon2,
                  size: 25.0,

                )),
          ],
        ),
      ],
    );
Widget myDivider() => Container(height: 0.5, color: Colors.grey[800]);




Widget defaultButton(
        {required Color background,
        double radius = 8.0,
        IconData? icon,
        required String text,
        required Function() function,
        required double width,
        required double height}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );

Widget defaultButtonWithIcon(
        {required Color background,
        double radius = 8.0,
        IconData? icon,
        required String text,
        required Function() function,
        required double width,
        required double height}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                text,
                style: const TextStyle(fontSize: 8, color: Colors.white),
              ),
            ),
            Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 15,
                )),
          ],
        ),
      ),
    );

Widget defaultTextField({
  required String hint,
  required TextInputType type,
  TextEditingController? controller,
  String? Function(String?)? validate,
   IconData? prefix,
  double? width,
  double? height,
  InputBorder? border,
  IconData? suffix,
  void Function()? funcSuffix,
  bool isPassword = false,
  String? Function(String?)? onchange,
}) =>
    Container(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onChanged: onchange,
        validator: validate,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            border: border,
            prefixIcon: Icon(prefix),
            suffixIcon: IconButton(onPressed: funcSuffix, icon: Icon(suffix))),
      ),
    );


Widget myDividor1() => Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey[600],
);
Widget myDividor2() => Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey[200],
);
Widget PostItem(PostModel model , context , index)=>Container(
  width: double.infinity,
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          Row(
            children: [
              InkWell(
                onTap: (){
                  TineLineCubit.get(context).goToProfilePerson(index);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius:25,
                  backgroundImage: NetworkImage(model.postData[index].userDataPost.photo),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        TineLineCubit.get(context).goToProfilePerson(index);
                      },
                      child: Row(
                        children: [
                          Text(
                            model.postData[index].userDataPost.name,
                            style:Theme.of(context).textTheme.bodyText1,

                          ),
                          const SizedBox(width: 5,),

                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          model.postData[index].dateOfPost,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(width: 3,),
                        Text(
                          model.postData[index].job,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15,),
              IconButton(onPressed: (){}, icon: const Icon(IconBroken.More_Square,size: 18,)),

            ],
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child:  myDividor2()  ,
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsetsDirectional.only(start:10.0),
            child: Text(
                model.postData[index].textPost!,
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
            ),
          ),

          if(model.postData[index].image != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 15.0),
              child: Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(model.postData[index].image!) ))
              ),
            ),
          const SizedBox(height: 10,),
          if(model.postData[index].image != null)
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: myDividor2(),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              BlocConsumer<ChatCubit , ChatState>(
                listener:(context, state){

                } ,
                builder: (context, state){
                  return defaultButtonWithIcon(
                    icon: Icons.send,
                    background: defaultColor,
                    text: 'Send Message',
                    function: ()async {
                     await ChatCubit.get(context).GetChatsFromPost( idUser: model.postData[index].userDataPost.id);
                      print(model.postData[index].userDataPost.id);
                      navigateTo(context, IndividualChatFromPost(index,model));
                    },
                    width: 120.0,
                    radius: 30.0,
                    height: 30.0,
                  );
                },
              ),
              ],
            ),

          ),

        ],
      ),
    ),
  ),
);

Widget ProfilePostWorkerItem(ProfileModel model , context , index)=>Container(
  width: double.infinity,
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          InkWell(
            onTap: (){
              // navigateTo(context, ProSendUser());
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius:25,
                  backgroundImage: NetworkImage(model.data!.posts![index].user!.photo!),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            model.data!.posts![index].user!.name!,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5,),

                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            model.data!.posts![index].date!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(width: 3,),
                          Text(
                            model.data!.posts![index].job!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(width: 15,),
                IconButton(onPressed: (){}, icon: const Icon(IconBroken.More_Square,size: 18,)),

              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: myDividor1(),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0),
            child: Text(
                model.data!.posts![index].description!,
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
            ),
          ),

          const SizedBox(height: 10,),
          if(model.data!.posts![index].image != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 15.0),
              child: Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(model.data!.posts![index].image!) ))
              ),
            ),
          if(model.data!.posts![index].image != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: myDividor2(),
          ),
          SizedBox(height: 10,)
        ],
      ),
    ),
  ),
);

Widget ProfilePostWorkerSendUserItem(WorkerSendUser model , context , index)=>Container(
  width: double.infinity,
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          InkWell(
            onTap: (){
              // navigateTo(context, ProSendUser());
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius:25,
                  backgroundImage: NetworkImage(model.data!.posts![index].user!.photo!),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            model.data!.posts![index].user!.name!,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5,),

                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            model.data!.posts![index].date!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(width: 3,),
                          Text(
                            model.data!.posts![index].time!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(width: 15,),
                IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz,size: 18,)),

              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: myDividor1(),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0),
            child: Text(
              model.data!.posts![index].description!,
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0),
          //   child: Container(
          //     width: double.infinity,
          //     child: Wrap(
          //       children: [
          //         Padding(
          //           padding: EdgeInsetsDirectional.only(end:5.0),
          //           child: MaterialButton(
          //             height: 25.0,
          //             minWidth: 1,
          //             onPressed: (){},
          //             padding: EdgeInsets.zero,
          //             child: Text(
          //               '#Software',
          //               style: Theme.of(context).textTheme.caption!.copyWith(color: defaultColor),
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsetsDirectional.only(end:5.0),
          //           child: MaterialButton(
          //             height: 25.0,
          //             minWidth: 1,
          //             onPressed: (){},
          //             padding: EdgeInsets.zero,
          //             child: Text(
          //               '#Software',
          //               style: Theme.of(context).textTheme.caption!.copyWith(color: defaultColor),
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsetsDirectional.only(end:5.0),
          //           child: MaterialButton(
          //             height: 25.0,
          //             minWidth: 1,
          //             onPressed: (){},
          //             padding: EdgeInsets.zero,
          //             child: Text(
          //               '#Software',
          //               style: Theme.of(context).textTheme.caption!.copyWith(color: defaultColor),
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsetsDirectional.only(end:5.0),
          //           child: MaterialButton(
          //             height: 25.0,
          //             minWidth: 1,
          //             onPressed: (){},
          //             padding: EdgeInsets.zero,
          //             child: Text(
          //               '#Software',
          //               style: Theme.of(context).textTheme.caption!.copyWith(color: defaultColor),
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsetsDirectional.only(end:5.0),
          //           child: MaterialButton(
          //             height: 25.0,
          //             minWidth: 1,
          //             onPressed: (){},
          //             padding: EdgeInsets.zero,
          //             child: Text(
          //               '#Software',
          //               style: Theme.of(context).textTheme.caption!.copyWith(color: defaultColor),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(height: 10,),
          if(model.data!.posts![index].image != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 15.0),
              child: Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(model.data!.posts![index].image!) ))
              ),
            ),
          if(model.data!.posts![index].image != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: myDividor2(),
            ),
          SizedBox(height: 10,)
        ],
      ),
    ),
  ),
);



/*Component manar*/

Widget MenuPage({ required Color color, required IconData icon ,required text, required fun , context}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          leading: CircleAvatar(
              backgroundColor: color,
              child: Icon(icon,
              color:Colors.white),
              ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 16),
              textScaleFactor: 1.5,
            ),
          ),
          trailing: AppBarIcons(
            icon: Icons.arrow_forward_ios_outlined,
            function: fun,
            size: 20,

          ),
          selected: true,
          onTap:fun),
    );


Widget AppBarIcons(
        {required IconData icon,
        required void Function()? function,
        required double size}) =>
    Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
          color: Colors.grey[500],
        ),
        onPressed: function,
      ),
    );

class TextFeild_ extends StatelessWidget {
  const TextFeild_(
      {Key? key,
      required this.icon,
      required this.text,
      required this.maxLine,
      required this.keyboardType,
      this.maxLength,
      this.minLine})
      : super(key: key);
  final IconData? icon;
  final String text;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        keyboardType: keyboardType,
        maxLines: maxLine,
        minLines: minLine,
        maxLength: maxLength,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          // labelText: text,
          labelText: text,
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}



Widget ColumnList() => Container(
      height: 120,
      padding: const EdgeInsets.all(0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://static4.depositphotos.com/1000393/362/i/600/depositphotos_3628253-stock-photo-smiling-manual-worker.jpg'),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 120,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                //ايروور لو التسكت كبير
                child: Text("  Mohamed Ahmed ",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                //ايروور لو التسكت كبير
                child: Text("  Mohamed Ahmed1  ",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ]),
    );



/*ahmed */

enum UserTypes { Worker, Custmer }

UserTypes? _UserTypes;

Widget default_Button({
  double width = 0.0,
  double height = 40.0,
  Color backgroundcolor = const Color(0xff4377ec),
  Color TextColor = Colors.white,
  bool isUpperCase = true,
  double radius = 50.0,
  required String text,
  required Function() function,
  required textStyle,
}) =>
    SizedBox(
      width: double.infinity,
      //height: 20.0,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: (width <= 550)
              ? const EdgeInsets.symmetric(horizontal: 100, vertical: 20)
              : EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 25),
          textStyle: TextStyle(
            fontSize: (width <= 550) ? 13 : 17,
          ),
        ),
        child: Text(isUpperCase ? text.toUpperCase() : text),
      ),
    );

Widget default_tTextFormField(
    {required TextEditingController? controller,
      TextInputType? type,
      bool isPassword =false ,
      required String? labelText,
      required IconData? prefix,
      IconData? suffix,
      double radius = 50.0,
      double height = 50.0,
      // required var validate,
      //required FormFieldValidator? validate,
      required FormFieldValidator<String>? validate,
      VoidCallback? suffixPressed,
      VoidCallback? onTap,
      bool isClickable = true,
      ValueChanged<String>? onFieldSubmitted,
      required TextInputType keyboardType,
      bool? obscureText,
    }) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  decoration: InputDecoration(
    // hintText: 'Email Adress',
    prefixIcon: Icon(prefix),
    labelText: labelText,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)
        )
    ),
    suffixIcon: IconButton(onPressed: suffixPressed, icon: Icon(suffix)),
  ),
  onFieldSubmitted: onFieldSubmitted,
  validator: validate,
  onTap: onTap,
  enabled: isClickable,
);

Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
  return InkWell(
    onTap: () {

    },
    child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          color: iconColor,
        )), //
  );
}

Widget default_RadioButton({
  required String text,
  required Function() function,
  // required textStyle,
}) =>
    Expanded(
      child: RadioListTile<UserTypes>(
        value: UserTypes.Worker,
        groupValue: _UserTypes,
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            fontFamily: 'Mulish',
          ),
        ),
        tileColor: Colors.deepPurple.shade50,
        dense: true,
        contentPadding: const EdgeInsets.all(0.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        onChanged: function(),
      ),
    );

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );





Widget deffaultTextButton({
  required VoidCallback? onPressed,
  required String text,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.blue,
        ),
      ),
    );

void showToast({
  required String? text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: choseToasteColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
enum ToastState { SUCCESS, ERORR, WORNING }
Color choseToasteColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = const Color(0xff4377ec);
      break;
    case ToastState.ERORR:
      color = Colors.red;
      break;
    case ToastState.WORNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget EditProfile({ required text, required fun}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap:fun,

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            textScaleFactor: 1.5,
          ),
        ),
        trailing: AppBarIcons(
          icon: Icons.arrow_forward_ios_outlined,
          function: fun,
          size: 20,
        ),
        selected: true,
      ),
    );

Widget EditButton({required  String text, required void Function() fun,
})=> Padding(
  padding: const EdgeInsets.all(8.0),
  child:   InkWell(
    onTap:fun ,
    child:   Container(



      padding: EdgeInsets.all(12.0),

      child: Row(children: [

        TextButton(onPressed: null, child: Text(text

          ,style: TextStyle(color: Colors.black,fontSize: 24,





          ),),),

        Spacer(),

        Icon(Icons.arrow_forward_ios_outlined)

      ],),



    ),
  ),
);












// Widget defaultButton({
//   double width = double.infinity,
//   double height = 40.0,
//   Color background = Colors.blue,
//   bool isUpperCase = true,
//   double radius = 0.0,
//   required Function() function,
//   required String text,
//   //double width = double.infinity,
//   // Color background = Colors.blue,
// }) =>
//     Container(
//       width: width,
//       child: MaterialButton(
//         onPressed: function,
//         child: Text(
//           '${isUpperCase ? text.toUpperCase() : text}',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//           ),
//         ),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius),
//         color: background,
//       ),
//     );
