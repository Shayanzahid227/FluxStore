import 'package:code_structure/firebase_options.dart';
import 'package:code_structure/ui/profile/profile_screen.dart';
import 'package:code_structure/ui/screens/authentication/log/login_with_emial/login_screen.dart';

import 'package:code_structure/ui/screens/feedback/feed_back_screen.dart';
import 'package:code_structure/ui/screens/home/home_screen.dart';
import 'package:code_structure/z_common/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(394, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xffFAF8F6)),
        home: FirebaseAuth.instance.currentUser != null
            ? ProfileScreen()
            : LogInScreen(),
      ),
    );
  }
}
