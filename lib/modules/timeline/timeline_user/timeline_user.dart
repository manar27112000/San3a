

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:path/path.dart';
import 'package:san3a/modules/menu_screen/menu_screen.dart';
import 'package:san3a/modules/search_screen/search.dart';
import 'package:san3a/modules/timeline/filtter.dart';
import 'package:san3a/shared/component/component.dart';

class TimeLineForUser extends StatefulWidget {
  TimeLineForUser({Key? key}) : super(key: key);

  @override
  State<TimeLineForUser> createState() => _TimeLineForUserState();
}

class _TimeLineForUserState extends State<TimeLineForUser> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller=ScrollController();
  final double itemSize=150;

  @override
  void onListenerController(){
    setState(() {});
  }
  @override
  void initState(){
    controller.addListener(onListenerController);
    super.initState();
  }
  @override
  void dispose(){
    controller.removeListener(onListenerController);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        key: scaffoldKey,
//backgroundColor: Color(0xFFB6EAFA),
        body:
        _body()
    );

  }

  Widget _body()=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Stack(
      children: [
        _lisview(),
        // Container(height: 100,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //       colors: [Colors.white,Colors.transparent]
        //
        //     )
        //   ),
        // )

      ],
    ),
  );

  Widget _lisview()=>ListView.builder(
      controller: controller,
      itemCount: 15,
      itemBuilder: (context, index) {
        final itemOffset=index*itemSize;
        final difference=controller.offset-itemOffset;
        final precent=1-(difference/(itemSize/2));
        double opacity=precent;
        double scale=precent;
        if(opacity>1.0)opacity=1.0;
        if(opacity<0.0)opacity=0.0;
        if(scale>1.0)scale=1.0;
        return Opacity(opacity: opacity,
            child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(scale,1.0),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: itemSize,
                    width: double.infinity,
                    alignment: Alignment.topCenter,

                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white
                        , borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                          // BoxShadow(
                          //     color: Colors.grey
                          //     ,blurRadius: 1,spreadRadius: 1
                          // )
                        ]
                    ),
                    child:  Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Row(

                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 40.0,
                              backgroundImage:
                              NetworkImage('https://via.placeholder.com/180'),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    height: 35,
                                    child: Wrap(children: [Container(child: Text("Manar Adel Ahmed",
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),width:200,),
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Wrap(children: [Container(child: Text("Manar Adel Ahmed Manar Adel Ahmed Manar Adel Ahmed   ",
                                    style: TextStyle(fontSize: 18),maxLines: 2,),width:200,),
                                  ]),
                                )
                              ],
                            )

                          ]),
                    ),
                  ),
                )));}

  );

}









//
// child:  Material(
// child: Container(
// height: 120,
// child: ListTile(
// leading: Container(
// width: 100,
// height: 100,
// child: GestureDetector(
// behavior: HitTestBehavior.translucent,
// onTap: () {},
// child:  CachedNetworkImage(
// imageUrl: 'https://static4.depositphotos.com/1000393/362/i/600/depositphotos_3628253-stock-photo-smiling-manual-worker.jpg',
//
// imageBuilder: (context, imageProvider) => Container(
//
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// image: DecorationImage(
// image: imageProvider, fit: BoxFit.cover),
// ),
// ),
// placeholder: (context, url) => CircularProgressIndicator(),
// errorWidget: (context, url, error) => Icon(Icons.error),
// ),
//
//
// ),
// ),
// onTap: () {},
// title: Text('mohamed ahmed',style: TextStyle(fontWeight: FontWeight.bold),),
// subtitle:const Text('mohamed ahmed mohamed ahmed mohamed ahmed mohamed'
// ' ahmed mohamed ahmed mohamedmohamedmohamedmohamedmohamedmohamedmohamedmohamed ahmed mohamed ahmed mohamed ahmed'),
// tileColor: Colors.grey,
//
// ),
// ),
//
// ),










