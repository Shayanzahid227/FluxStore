import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/ui/screens/authentication/log/login_screen.dart';
import 'package:code_structure/ui/screens/authentication/utils/sign_in_error_message.dart';
import 'package:code_structure/ui/screens/home/home_screen_viev_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  int counter = 0;
  int _counter() {
    return counter = counter + 1;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
          builder: (context, model, child) => Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.purple.shade200,
                  actions: [
                    IconButton(
                        onPressed: () {
                          _auth.signOut().then(
                            (value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInScreen(),
                                ),
                              );
                            },
                          ).onError(
                            (error, stackTrace) {
                              Utils().ToastMessage(
                                error.toString(),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.logout)),
                    30.horizontalSpace
                  ],
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        // child: Text("shayan zahid $counter"),
                        child: Text(""),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // _counter();
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          "welcome back ",
                          style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        )),
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
