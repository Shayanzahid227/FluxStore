import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/custom_widgets/studio_flex/confirm_button.dart';

import 'package:code_structure/custom_widgets/studio_flex/text_feild.dart';
import 'package:code_structure/ui/screens/home/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatNewPasswordScreen extends StatefulWidget {
  const CreatNewPasswordScreen({super.key});

  @override
  State<CreatNewPasswordScreen> createState() => _CreatNewPasswordScreenState();
}

class _CreatNewPasswordScreenState extends State<CreatNewPasswordScreen> {
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
  bool _IsSelected = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void OnClick() {
    setState(() {
      _IsSelected = !_IsSelected;
    });
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Create new password  ",
                  style: GoogleFonts.sansita(fontSize: 25),
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  " Your new password must be different \nfrom previously used password",
                  style: GoogleFonts.sansita(
                      fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ),
              70.verticalSpace,
              customtextformfeild(
                text: "New password",
                suffixIcon: GestureDetector(
                    onTap: () {
                      OnClick();
                    },
                    child: Icon(_IsSelected
                        ? Icons.visibility_off_outlined
                        : Icons.visibility)),
                obscureText: _IsSelected,
              ),
              20.verticalSpace,
              customtextformfeild(
                text: "Confirm Password",
                suffixIcon: GestureDetector(
                    onTap: () {
                      OnClick();
                    },
                    child: Icon(_IsSelected
                        ? Icons.visibility_off_outlined
                        : Icons.visibility)),
                obscureText: _IsSelected,
              ),
              70.h.verticalSpace,
              CustomConfirmButton(
                  text: "Confirm",
                  onPressed: () {
                    _showBottomSheet();
                  })
            ],
          ),
        ),
      ),
    );
  }

  // Function to show the bottom sheet
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            width: double.infinity,
            height: 400.h,
            child: Column(
              children: [
                60.h.verticalSpace,
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AppAssets().passchange),
                          // fit: BoxFit.cover,
                          scale: 3)),
                ),
                20.h.verticalSpace,
                Text(
                  "Your password has been changhed ",
                  style: GoogleFonts.sansita(fontSize: 20),
                ),
                20.verticalSpace,
                Text(
                  "Welcome back! Discover now!",
                  style: GoogleFonts.sansita(
                      fontSize: 14, fontWeight: FontWeight.w300),
                ),
                20.h.verticalSpace,
                Container(
                  width: 200.h,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primaryConfirmButtonColor,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Text(
                        "Browse to home ",
                        style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp),
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}
