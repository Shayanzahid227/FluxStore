import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/custom_widgets/other_widget/line_with_text.dart';

import 'package:code_structure/custom_widgets/studio_flex/login_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/social_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/text_feild.dart';
import 'package:code_structure/ui/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:code_structure/ui/screens/authentication/forget/forget_screen.dart';
import 'package:code_structure/ui/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ///
  ///  user registration in firebase
  ///

  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      print("SignIn failed $e");
    }
  }

  final _formKey = GlobalKey<FormState>();

  final RegExp _emailRegex = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  ///
  ///function for validation
  ///
  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty || !_emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length < 6) {
      return 'Enter a valid password';
    }
    return null;
  }

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
          child: Form(
            key: _formKey,
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

                ///
                ///     text field for email
                ///
                customtextformfeild(
                  onChanged: (value) {
                    emailController.text = value;
                  },
                  controller: emailController,
                  text: "Email address",
                  obscureText: false,
                  validator: _validateEmail,
                ),
                20.verticalSpace,

                ///
                ///     text field for password
                ///
                customtextformfeild(
                  onChanged: (value) {
                    passwordController.text = value;
                  },
                  controller: passwordController,
                  text: "Password", obscureText: false,
                  validator: _validatePassword,
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
                  onTap: () {},
                  child: CustomloginButton(
                    text: "LOG IN",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );

                        ///
                        /// function to register user already declared on the top
                        ///
                        register();
                      }
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
                              builder: (context) => SignInScreen(),
                            ),
                          );
                        },
                        child: Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
