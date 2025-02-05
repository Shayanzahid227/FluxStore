import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/ui/screens/home/home_screen_viev_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text("shayan zahid $counter"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _counter();
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 120,
                        color: Colors.deepPurple,
                        child: Center(
                            child: Text(
                          "tap me ",
                          style: TextStyle(color: whiteColor),
                        )),
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
