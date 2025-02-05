import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/custom_widgets/a_buttons/circular_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/confirm_button.dart';
import 'package:code_structure/ui/screens/authentication/new_password/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            70.h.verticalSpace,
            CustomCircularButton(onPressed: () {}, icon: Icons.arrow_back_ios),
            40.h.verticalSpace,
            Text(
              "Creat new Password",
              style: GoogleFonts.sansita(fontSize: 25),
            ),
            20.verticalSpace,
            Text(
              "Please enter the verification code we sent\n to your email address",
              style: GoogleFonts.sansita(
                  fontSize: 14, fontWeight: FontWeight.w300),
            ),
            70.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: .0),
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                showCursor: true,
                appContext: context,
                length: 4,
                obscureText: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  // shape: FieldShape.box,
                  fieldHeight: 70,
                  fieldWidth: 70,
                  activeColor: whiteColor,
                  activeFillColor: whiteColor,
                  errorBorderColor: greyColor,
                  inactiveColor: greyColor,

                  // borderRadius: BorderRadius.circular(15),
                ),
                beforeTextPaste: (allow) {
                  return true;
                },
                animationDuration: const Duration(
                  milliseconds: 500,
                ),
                onCompleted: (x) {
                  print("Compleated");
                },
              ),
            ),
            30.h.verticalSpace,
            GestureDetector(
              onTap: () {},
              child: Text(
                "Resend it in 00:10 ",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            20.verticalSpace,
            Center(
              child: CustomConfirmButton(
                  text: "Confirm",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatNewPasswordScreen()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
