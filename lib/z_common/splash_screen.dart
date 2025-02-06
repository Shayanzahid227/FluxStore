//import 'dart:ffi';

import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/studio_flex/expendedbutton.dart';
import 'package:code_structure/ui/screens/authentication/log/login_screen.dart';
import 'package:code_structure/ui/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //        // builder: (context) => isLogin(),
  //         builder: (context) => IntroScreens_123(),
  //       ),
  //     );
  //   });
  // }

  void _isLogin() async {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    await Future.delayed(Duration.zero); // Ensure build is complete
    ///
    ///        to check who is the current user
    ///
    print("Current User: $user");
    if (user != null) {
      Navigator.pushReplacement(
        // Use pushReplacement
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        // Use pushReplacement
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _isLogin(); // Call the login check when the SplashScreen initializes
  }

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
            Stack(
              children: [
                Container(
                  height: screenHeight * 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets().splash), fit: BoxFit.cover
                        // AppAssets().splash,
                        ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.56,
                        ),
                        Text(
                          "Welcome to Gemstore!",
                          style: style25B.copyWith(color: whiteColor),
                        ),
                        Text(
                          "the home for fascinate",
                          style: style16N.copyWith(
                              color: whiteColor, fontSize: 20),
                        ),
                        80.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            _isLogin();
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => IntroScreens_123(),
                            //     ),
                            //   );
                          },
                          child: CustomExpendButton(text: "Get Started"),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
