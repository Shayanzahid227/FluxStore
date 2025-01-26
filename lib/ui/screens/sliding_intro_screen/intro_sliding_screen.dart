import 'package:code_structure/ui/screens/1_intro_screen/intro_1.dart';
import 'package:code_structure/ui/screens/1_intro_screen/intro_2.dart';
import 'package:code_structure/ui/screens/1_intro_screen/intro_3.dart';
import 'package:flutter/material.dart';

class IntroScreens_123 extends StatefulWidget {
  const IntroScreens_123({super.key});

  @override
  State<IntroScreens_123> createState() => _IntroScreens_123State();
}

class _IntroScreens_123State extends State<IntroScreens_123> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [Intro1(), Intro2(), Intro3()],
    );
  }
}
