import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/custom_widgets/studio_flex/expendedbutton.dart';
import 'package:code_structure/ui/screens/authentication/log/login_with_emial/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    // double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfff464447),
        child: Stack(
          children: [
            Container(
              height: screenheight * 0.6,
              color: whiteColor,
            ),
            60.verticalSpace,
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "discover  something  new",
                  style: GoogleFonts.sansita(fontSize: 22),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "special new arrival for you ",
                  style: GoogleFonts.sansita(fontSize: 17),
                ),
              ),
            ),

            ///
            ///        image
            ///
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Center(
                //alignment: Alignment.center,
                child: Container(
                  height: 500,
                  width: 290,
                  decoration: BoxDecoration(
                      color: Color(0xfffe7e8e9),
                      image: DecorationImage(
                          image: AssetImage(AppAssets().intro1),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),

            ///
            ///     three dots for showing number of pic
            Padding(
              padding: const EdgeInsets.only(top: 530),
              child: Center(
                child: Container(
                  height: 10,
                  width: 200,
                  child: Image(
                    image: AssetImage(AppAssets().slider1),
                  ),
                ),
              ),
            ),

            ///
            ///       button
            ///

            Padding(
              padding: EdgeInsets.only(top: 630.h),
              child: GestureDetector(
                onTap: () {
                  print("working");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogInScreen()));
                },
                child: Center(child: CustomExpendButton(text: "shopping now")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
