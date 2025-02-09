import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/custom_widgets/other_widget/line_with_text.dart';

import 'package:code_structure/custom_widgets/studio_flex/login_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/social_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/text_feild.dart';
import 'package:code_structure/ui/screens/authentication/log/login_with_emial/login_screen.dart';
import 'package:code_structure/ui/screens/authentication/sign_up/sin_in_view_model.dart';
import 'package:code_structure/ui/screens/authentication/utils/sign_in_error_message.dart';
import 'package:code_structure/ui/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? name;
  String? email;
  var pasword;
  var confirmPassword;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignInViewModel(),
        child: Consumer<SignInViewModel>(
          builder: (context, model, child) => Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                  top: 93,
                ),
                child: Form(
                  // key: _fromKey,
                  key: model.formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Creat ",
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
                      30.verticalSpace,

                      ///
                      ///  text feild for name
                      ///
                      customtextformfeild(
                        onChanged: (value) {
                          name = value;
                        },
                        text: "Enter your name",
                        obscureText: false,

                        validator: model.validateName,
                        // validator: _validateName,
                      ),
                      20.verticalSpace,

                      ///
                      ///  text feild for email
                      ///
                      customtextformfeild(
                        onChanged: (value) {
                          email = value;
                        },
                        text: "Email address",
                        obscureText: false,
                        validator: model.validateEmail,
                        controller: model.emailController,
                        // validator: _validateEmail,
                        // controller: _emailController,
                      ),
                      20.verticalSpace,

                      ///
                      ///  text feild for password
                      ///
                      customtextformfeild(
                        onChanged: (value) {
                          pasword = value;
                        },
                        text: "Password",
                        obscureText: false,
                        validator: model.validatePassword,
                        controller: model.passwordController,
                        // validator: _validatePassword,
                        // controller: _passwordController,
                      ),
                      20.verticalSpace,

                      ///
                      ///  text feild for confirm password
                      ///
                      customtextformfeild(
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        text: "Confirm Password",
                        obscureText: false,
                        validator: model.validateConfirmPassword,
                        controller: model.confirmPasswordController,
                        // validator: _validateConfirmPassword,
                        // controller: _confirmPasswordController,
                      ),
                      41.verticalSpace,
                      CustomloginButton(
                        loading: model.loading,
                        // loading: loading,

                        text: "SIGN UP",
                        onPressed: () async {
                          print("******************************");
                          print("user name : $name");
                          print("user email : $email)");
                          print("user password :$pasword");
                          print("user confirm password :$confirmPassword");
                          print("******************************");
                          // if (_fromKey.currentState!.validate())
                          if (model.formKey.currentState!.validate()) {
                            // loading        ***********
                            model.loading = true;
                            // loading = true; // show loading
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                          await model.signIn();
                          // signIn();
                        },
                      ),
                      10.verticalSpace,
                      CustomLineWithText(text: "or signup with"),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomsocialIconButton(
                              onPressed: () {},
                              imagePath: AppAssets().facebook),
                          15.horizontalSpace,
                          CustomsocialIconButton(
                              onPressed: () {},
                              imagePath: AppAssets().facebook),
                          15.horizontalSpace,
                          CustomsocialIconButton(
                              onPressed: () {}, imagePath: AppAssets().facebook)
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have account?  "),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogInScreen()));
                              },
                              child: Text("Log in"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
///
/// this is done in view model it is just for reference
///
 //  final _fromKey = GlobalKey<FormState>();
  // ///
  // /// loading animation when user enter their details
  // ///
  // bool loading = false;

  // ///
  // /// this step will give us API exposure of registration
  // ///
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<void> signIn() async {
  //   try {
  //     await _auth
  //         .createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     )
  //         .then((value) {
  //       setState(() {
  //         loading = false;
  //       });
  //     }).onError(
  //       (error, stackTrace) {
  //         Utils().ToastMessage(
  //           error.toString(),
  //         );
  //         setState(() {
  //           loading = false;
  //         });
  //       },
  //     );
  //   } catch (e) {
  //     print("signIn Failed$e");
  //   }
  // }

  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  // TextEditingController _confirmPasswordController = TextEditingController();

  // final RegExp _emailRegex = RegExp(
  //   r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  // );

  // ///
  // ///  for name
  // ///
  // String? _validateName(String? value) {
  //   if (value!.trim().isEmpty) {
  //     return 'Enter your name ';
  //   }
  //   return null;
  // }

  // ///
  // /// for emial
  // ///
  // String? _validateEmail(String? value) {
  //   if (value!.trim().isEmpty) {
  //     return 'Enter your email';
  //   } else if (!_emailRegex.hasMatch(value)) {
  //     return "enter valid email e.g abc@gmail.com";
  //   }
  //   return null;
  // }

  // ///
  // /// for password
  // ///
  // String? _validatePassword(String? value) {
  //   if (value == null || value.trim().isEmpty || value.trim().length < 6) {
  //     return 'Enter a valid password';
  //   }
  //   return null;
  // }

  // ///
  // ///for confirm password
  // ///
  // String? _validateConfirmPassword(value) {
  //   if (_passwordController.text != _confirmPasswordController.text) {
  //     return 'Confirm password is incorrect ';
  //   }
  //   return null;
  // }
  //]
