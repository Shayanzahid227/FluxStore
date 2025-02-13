import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/custom_widgets/other_widget/line_with_text.dart';
import 'package:code_structure/custom_widgets/studio_flex/login_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/social_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/text_feild.dart';
import 'package:code_structure/ui/screens/authentication/log/login_with_emial/login_screen.dart';
import 'package:code_structure/ui/screens/authentication/sign_up/sin_in_view_model.dart';
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
  final currentUser = FirebaseAuth.instance.currentUser?.uid;
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
                        "Create ",
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
                      text: "Enter your name",
                      obscureText: false,
                      controller: model.nameController,

                      validator: model.validateName,
                      // validator: _validateName,
                    ),
                    20.verticalSpace,

                    ///
                    ///  text feild for email
                    ///
                    customtextformfeild(
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
                        print('user id: $currentUser');
                        print(
                            "user name : ${model.nameController.text.toString()}");
                        print(
                            "user email : ${model.emailController.text.toString()})");
                        print(
                            "user password :${model.passwordController.text.toString()}");
                        print(
                            "user confirm password :${model.confirmPasswordController.text.toString()}");
                        print("******************************");

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

                        ///
                        ///  it will just sigIn the user in firebase Authentication
                        ///
                        await model.signIn();

                        ///
                        ///  it will store the user data in firebase firestore
                        ///
                        model.uploadUserDataToFireStore();
                        ////
                      },
                    ),
                    10.verticalSpace,
                    CustomLineWithText(text: "or signup with"),
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
                                  builder: (context) => LogInScreen(),
                                ),
                              );
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
      ),
    );
  }
}
