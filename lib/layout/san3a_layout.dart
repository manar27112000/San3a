
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/layout/cubit/states_layout.dart';
import 'package:san3a/modules/add_post_screen/add_post_screen.dart';
import 'package:san3a/modules/timeline/filtter.dart';


import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/styles/icon_broken.dart';


class San3aLayout extends StatelessWidget {
  const San3aLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<San3aLayoutCubit, San3aLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = San3aLayoutCubit.get(context);
        final PageStorageBucket bucket = PageStorageBucket();

        String nameAppBar = cubit.nameApp[cubit.currentIndex];
        return Scaffold(

          appBar:cubit.currentIndex==3? defaultAppBar(
              text: nameAppBar,
              func1 : (){},
              func2 :(){},
              icon1:null ,
              icon2:IconBroken.Search

          ): defaultAppBar(
            text: nameAppBar,
            func1 : (){},
            func2 :(){
              print(ZoomDrawer.of(context)!.isOpen());
              if(ZoomDrawer.of(context)!.isOpen()){
                ZoomDrawer.of(context)!.close();
              }else{ZoomDrawer.of(context)!.open();}
             // navigateTo(context, Filter());
            },
            icon1: IconBroken.Search,
            icon2: IconBroken.Filter_2,


          ),
           body: PageStorage(
            bucket: bucket,
            child: cubit.bottomScreens[cubit.currentIndex],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigateTo(context, AddScreen());
            },
            child: const Icon(
              Icons.add,
            ),

          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: SizedBox(
              height: 65.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 40.0,
                        onPressed: () {
                          cubit.currentIndex = 0;
                          cubit.changeBottom(cubit.currentIndex);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconBroken.Home,
                              color: cubit.currentIndex == 0
                                  ? Colors.blue
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  color: cubit.currentIndex == 0
                                      ? Colors.blue
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40.0,
                        onPressed: () {
                          cubit.currentIndex = 1;
                          cubit.changeBottom(cubit.currentIndex);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconBroken.Notification,
                              color: cubit.currentIndex == 1
                                  ? Colors.blue
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              'Notifi',
                              style: TextStyle(
                                  color: cubit.currentIndex == 1
                                      ? Colors.blue
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 40.0,
                        onPressed: () {
                          cubit.currentIndex = 2;
                          cubit.changeBottom(cubit.currentIndex);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Icon(
                                  IconBroken.Chat,
                                  size: 25.0,
                                  color: cubit.currentIndex == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 6,
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Chat',
                              style: TextStyle(
                                  color: cubit.currentIndex == 2
                                      ? Colors.blue
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40.0,
                        onPressed: () {
                          cubit.currentIndex = 3;
                          cubit.changeBottom(cubit.currentIndex);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconBroken.Setting,
                              color: cubit.currentIndex == 3
                                  ? Colors.blue
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              'Setting',
                              style: TextStyle(
                                  color: cubit.currentIndex == 3
                                      ? Colors.blue
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
