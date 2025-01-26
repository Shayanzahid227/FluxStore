import 'package:code_structure/core/constants/app_asset.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/custom_widgets/studio_flex/expendedbutton.dart';
import 'package:code_structure/ui/screens/2_authentiction/1_login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
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
                  "Updated  trendy  outfit",
                  style: GoogleFonts.sansita(fontSize: 22),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Favorite brands and hottest trends ",
                  style: GoogleFonts.sansita(fontSize: 17),
                ),
              ),
            ),
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
                          image: AssetImage(AppAssets().intro2),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 530),
              child: Center(
                  child: Container(
                      height: 10,
                      width: 200,
                      child: Image(image: AssetImage(AppAssets().slider2)))),
            ),
            Padding(
                padding: EdgeInsets.only(top: 620.h),
                child: Center(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
                        },
                        child: CustomExpendButton(text: "shopping now"))))
          ],
        ),
      ),
    );
  }
}
