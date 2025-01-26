import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/core/constants/colors.dart';

import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/studio_flex/expendedbutton.dart';
import 'package:code_structure/ui/screens/1_intro_screen/intro_1.dart';
import 'package:code_structure/ui/screens/sliding_intro_screen/intro_sliding_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init() async {
  //   await Future.delayed(const Duration(seconds: 2), () {
  //     // navigator and rout mean from one page to another
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => IntroScreens_123(),
  //     ));
  //   });
  // }

  // @override
  // void initState() {
  //   init();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              height: 100,
              width: 201,
              color: blackColor,
            ),
            Image.asset(
              AppAssets().splash,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.56,
                  ),
                  Text("Welcome to Gemstore!",
                      style: style25B.copyWith(color: whiteColor)),
                  Text("the home for fashionate",
                      style:
                          style16N.copyWith(color: whiteColor, fontSize: 20)),
                  80.verticalSpace,
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Intro1()));
                      },
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IntroScreens_123()));
                          },
                          child: CustomExpendButton(text: "Get Started")))
                ],
              ),
            )
          ]),
        ],
      ),
    ));
  }
}
