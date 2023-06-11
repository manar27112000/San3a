import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/models/profileModel.dart';
import 'package:san3a/modules/Login_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/add_post_screen/add_post_screen.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_states.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/styles/colors.dart';
import 'package:san3a/shared/styles/icon_broken.dart';

class ProWorker extends StatelessWidget {
  const ProWorker( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ProfileWorkerCubit()..GetProfilePostsWorker(token: token!),
      child: BlocConsumer<ProfileWorkerCubit , ProfileWorkerState>(
        listener:(context , state){

        } ,
        builder: (context , state){
          var Cubit= ProfileWorkerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon:Icon(Icons.arrow_back,),),
              title: Text('Profile',
                style:Theme.of(context).textTheme.bodyText1),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () { navigateTo(context, AddScreen()); },
              child: Icon(IconBroken.Edit),
            ),
            body: ConditionalBuilder(
              condition: state is GetProfilePostWorkerSuccessState,
              builder: (context)=>SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            height: 170.0,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: NetworkImage(
                                      '${LoginCubit.get(context).loginModel!.data!.photo}'),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '${LoginCubit.get(context).loginModel!.data!.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold)
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffe59819),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffe59819),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffe59819),
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Color(0xffe59819),
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Color(0xffe59819),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child:  Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae elementum nulla, at ornare est',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            children: [
                              Row(
                                children:  [
                                  Text('Details',
                                      style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.0,
                                          fontSize: 18)),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              if(Cubit.getProfile!.data!.userData!.role != 'customer')
                                Row(
                                  children: [
                                    Row(
                                      children:  [
                                        Icon(Icons.work_history),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text('Job',
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 18)),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Row(
                                      children:  [
                                        Text('Mechanices',
                                            style: Theme.of(context).textTheme.bodyText1,
          )],
                                    )
                                  ],
                                ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children:  [
                                      Icon(Icons.home),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('Lives in',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 18)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children:  [
                                      Text('AlHaram street',
                                          style: Theme.of(context).textTheme.bodyText1,
                                      )],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              if(Cubit.getProfile!.data!.userData!.role! != 'customer')
                                Row(
                                  children: [
                                    Row(
                                      children:  [
                                        Icon(Icons.date_range),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text('Born',
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 18)),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Row(
                                      children:  [
                                        Text('25-11-2022',
                                            style: Theme.of(context).textTheme.bodyText1,
                                        )],
                                    )
                                  ],
                                ),
                              if(Cubit.getProfile!.data!.userData!.role! != 'customer')
                                const SizedBox(
                                  height: 15.0,
                                ),
                              Row(
                                children: [
                                  Row(
                                    children:  [
                                      Icon(Icons.add_location_alt_sharp),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('From',
                                          style:Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 18)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children:  [
                                      Text('Giza',
                                          style: Theme.of(context).textTheme.bodyText1),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>ProfilePostWorkerItem(Cubit.getProfile!,context , index),
                        separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                        itemCount: Cubit.getProfile!.data!.posts!.length),
                  ],
                ),
              ),
              fallback:(context)=> Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
