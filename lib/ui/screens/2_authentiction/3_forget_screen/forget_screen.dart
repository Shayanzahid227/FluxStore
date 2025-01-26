import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/strings.dart';
import 'package:code_structure/custom_widgets/a_buttons/circular_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/confirm_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/login_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/text_feild.dart';
import 'package:code_structure/ui/screens/2_authentiction/4_pin_code/pin_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(boxShadow: []),
                child: CustomCircularButton(
                  onPressed: () {},
                  icon: Icons.arrow_back_ios_rounded,
                  // backgroundColor: whiteColor,
                ),
              ),
            ),
            30.verticalSpace,
            Text(
              "Forget Password?",
              style: GoogleFonts.sansita(fontSize: 25),
            ),
            20.verticalSpace,
            Text(
              "Enter email associated with your account \nand we’ll send and email with instructions to \nreset your password",
              style: GoogleFonts.sansita(
                  fontSize: 14, fontWeight: FontWeight.w300),
            ),
            50.verticalSpace,
            customtextformfeild(
              text: "enter your email here ",
              prefixIcon: Icon(
                Icons.email_outlined,
                //color: blackColor,
              ),
              obscureText: false,
            ),
            100.verticalSpace,
            Center(
                child: CustomConfirmButton(
                    text: "Confirm",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PinCodeScreen()));
                    }))
          ],
        ),
      ),
    );
  }
}
