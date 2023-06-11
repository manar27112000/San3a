import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Login_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/Login_Screen/Cubit/states.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/styles/colors.dart';

class ProSendWorker extends StatelessWidget {
  const ProSendWorker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit , AppLoginStates>(
      listener:(context , state){

      } ,
      builder: (context , state){
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 120.0,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            '${LoginCubit.get(context).loginModel!.data!.photo}',
                      ),),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              '${LoginCubit.get(context).loginModel!.data!.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultButton(
                              text: 'Send Message',
                              function: () {},
                              background: defaultColor,
                              width: 160.0,
                              radius: 30.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
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
                              const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae elementum nulla, at ornare est',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: const [],
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(
                  height: 20.0,
                ),


                Column(
                  children: [
                    Row(
                      children: const [
                        Text('Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textColor,
                                letterSpacing: 2.0,
                                fontSize: 18)),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.work_history),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('Job',
                                style: TextStyle(color: textColor, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: const [
                            Text('Mechanices',
                                style: TextStyle(
                                  color: textColor,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.home),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('Lives in',
                                style: TextStyle(color: textColor, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: const [
                            Text('AlHaram street',
                                style: TextStyle(
                                  color: textColor,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.date_range),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('Born',
                                style: TextStyle(color: textColor, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: const [
                            Text('25-11-2022',
                                style: TextStyle(
                                  color: textColor,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.add_location_alt_sharp),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('From',
                                style: TextStyle(color: textColor, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: const [
                            Text('Giza',
                                style: TextStyle(
                                  color: textColor,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),


                // buildPostWithIamge(context),
                // const SizedBox(
                //   height: 5,
                // ),
                // buildPost(context),
                // const SizedBox(
                //   height: 5,
                // ),
                // buildPostWithIamge(context),
                // const SizedBox(
                //   height: 5,
                // ),
                // buildPost(context),
                // const SizedBox(
                //   height: 5,
                // ),
                // buildPostWithIamge(context),
                // const SizedBox(
                //   height: 5,
                // ),
                // buildPost(context),
                // const SizedBox(
                //   height: 5,
                // ),
                // buildPostWithIamge(context),
                // const SizedBox(
                //   height: 5,
                // ),
                // buildPost(context),

                // ConditionalBuilder(
                //   condition: true,
                //   builder: (BuildContext context) =>buildPost(),
                //   fallback: (BuildContext context) =>CircularProgressIndicator(),
                //
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Container(
// width: double.infinity,
// height: 500.0,
// color: Colors.grey[200],
// child: Column(
// children: [
// Expanded(
// flex: 1,
// child: Column(
// children: [
// Container(
// width: double.infinity,
// height: 100.0,
// color: Colors.amber,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae elementum nulla, asdaswfwf a saw at ornare est. Pellentesque ac feugiat eros, non pulvinar lacus. In consequat turpis laoreet consequat consequat. Mauris vitae.',
// maxLines: 4,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// )
// ],
// ),
// ),
// Expanded(
// flex: 2,
// child: Row(
// children: [Container(height: 50.0, color: Colors.orange)],
// ),
// ),
// Expanded(
// flex: 0,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// height: 30.0,
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text('25-11-2023'),
// Spacer(),
// defaultButton(
// background: defaultColor,
// text: 'Send Message',
// function: (){},
// width: 160.0,
// radius: 30.0,
// height: 30.0,
// ),
// ],
// ),
// ),
// )),
// ],
// ),
// ),
