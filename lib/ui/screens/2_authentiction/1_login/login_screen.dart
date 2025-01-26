import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/custom_widgets/other_widget/line_with_text.dart';
import 'package:code_structure/custom_widgets/studio_flex/expendedbutton.dart';
import 'package:code_structure/custom_widgets/studio_flex/login_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/social_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/text_feild.dart';
import 'package:code_structure/ui/screens/2_authentiction/2_sign_up/sign_up_screen.dart';
import 'package:code_structure/ui/screens/2_authentiction/3_forget_screen/forget_screen.dart';
import 'package:code_structure/ui/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //final _auth = FirebaseAuth.instance;

  // Future<void> register() async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //   } catch (e) {
  //     print("SignIn failed: $e");
  //   }
  // }

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  //final _fromKey = GlobalKey<FormState>();
  // final RegExp _emailRegex = RegExp(
  //   r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            top: 93,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Log into  ",
                  style: GoogleFonts.sansita(fontSize: 25),
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Your account",
                  style: GoogleFonts.sansita(fontSize: 25),
                ),
              ),
              70.verticalSpace,
              customtextformfeild(
                text: "Email address",
                obscureText: false,
              ),
              20.verticalSpace,
              customtextformfeild(
                text: "Password", obscureText: false,
                //obscureText: false,
              ),
              30.verticalSpace,
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetScreen()));
                      },
                      child: Text("Forget Password? "))),
              45.0.verticalSpace,
              GestureDetector(
                child: CustomloginButton(
                  text: "LOG IN",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
              ),
              10.verticalSpace,
              CustomLineWithText(text: "or Log in with"),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomsocialIconButton(
                      onPressed: () {}, imagePath: AppAssets().facebook),
                  15.horizontalSpace,
                  CustomsocialIconButton(
                      onPressed: () {}, imagePath: AppAssets().facebook),
                  15.horizontalSpace,
                  CustomsocialIconButton(
                      onPressed: () {}, imagePath: AppAssets().facebook)
                ],
              ),
              80.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?  "),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                      child: Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
