import 'dart:math';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'package:path/path.dart';
import 'package:san3a/models/on_borading_model.dart';
import 'package:san3a/shared/component/appLocal.dart';
import 'package:san3a/shared/component/component.dart';

import '../Login_Screen/Login_Screen.dart';

class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int _currentIndex = 0;
  final PageController _pageController = PageController();
  OnboardingModel? onboardingModel;


  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> tabs = [

      OnboardingModel(
        'assets/animations/plumbers.json',
        '${getLang(context,"GetYourworker")}',
      ),
      OnboardingModel(
        'assets/animations/chat.json',
        '${getLang(context,"chatwithworkers")}'
      ),
      OnboardingModel(
        'assets/animations/navigation.json',
         '${getLang(context,"nearestplace")}'


      ),
    ];
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          CustomPaint(
            painter: ArcPainter(),
            child: SizedBox(
              height: screenSize.height / 1.5,
              width: screenSize.width,
            ),
          ),
          Positioned(
            top: 30,
            right: 5,
            left: 5,
            child: Lottie.asset(
              tabs[_currentIndex].lottieFile,
              key: Key('${Random().nextInt(999999999)}'),
              width: 320,
              height: 320,
              alignment: Alignment.topCenter,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 310,
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: tabs.length,
                      itemBuilder: (BuildContext context, int index) {
                        OnboardingModel tab = tabs[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              tab.title,
                              style: const TextStyle(
                                fontSize: 27.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Text(
                            //   tab.subtitle,
                            //   style: const TextStyle(
                            //     fontSize: 17.0,
                            //     color: Colors.white70,
                            //   ),
                            //   textAlign: TextAlign.center,
                            // )
                          ],
                        );
                      },
                      onPageChanged: (value) {
                        _currentIndex = value;
                        setState(() {});
                      },
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int index = 0; index < tabs.length; index++)
                        _DotIndicator(isSelected: index == _currentIndex),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        AnimatedButton(
                          height: 40,
                          width: double.infinity,
                          text: '${getLang(context,"next")}',
                          textStyle: TextStyle(color: Colors.black,fontSize: 20),
                          isReverse: true,
                          selectedTextColor: Colors.black,
                          transitionType: TransitionType.LEFT_TO_RIGHT,

                          backgroundColor: Colors.white,
                          borderColor: Colors.white,
                          borderRadius: 50,
                          borderWidth: 1,
                          onPress: () {
                            if (_currentIndex == 2) {

                              navigateTo(context,Login_Screen() );
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            }

                          },
                        ),
                        const SizedBox(height: 10,),

                        AnimatedButton(
                          height: 40,
                          width: double.infinity,
                          text: '${getLang(context,"skip")}',
                          textStyle: TextStyle(color: Colors.black,fontSize: 20),
                          isReverse: true,
                          selectedTextColor: Colors.black,
                          transitionType: TransitionType.LEFT_TO_RIGHT,

                          backgroundColor: Colors.yellowAccent,
                          borderColor: Colors.yellowAccent,
                          borderRadius: 50,
                          borderWidth: 1, onPress: () {
                          navigateTo(context,Login_Screen() );
                        },
                        ),
                        const SizedBox(height: 40,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 170)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 170)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()..color = Colors.yellowAccent);

    Path whiteArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, size.height - 175)
      ..quadraticBezierTo(
          size.width / 2, size.height - 60, size.width, size.height - 185)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whiteArc, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DotIndicator extends StatelessWidget {
  final bool isSelected;

  const _DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 6.0,
        width: 6.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.white38,
        ),
      ),
    );
  }
}



