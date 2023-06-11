import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/styles/colors.dart';

class ProSendUser extends StatelessWidget {
  const ProSendUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back,color: Colors.black,),),
          title: Text('Profile',
        style: TextStyle(
          color: Colors.black,
              fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
          centerTitle: true,
      ),
      body:
      Padding(
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
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'http://ridley-thomas.lacounty.gov/wp-content/uploads/2011/09/workerProfile.jpg'),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Mohamed Ahmed',
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



              const SizedBox(
                height: 20.0,
              ),

// Container(
//   height: 1,
//   width: double.infinity,
//   color: Colors.grey[100],
// ),

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
      ),
    );
  }
}
