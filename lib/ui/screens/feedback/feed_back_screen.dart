import 'package:code_structure/core/constants/colors.dart';

import 'package:code_structure/custom_widgets/studio_flex/login_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/text_feild.dart';
import 'package:code_structure/ui/screens/authentication/utils/sign_in_error_message.dart';
import 'package:code_structure/ui/screens/feedback/feed_back_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  ///
  ///
  ///
  bool loading = false;

  final DatabaseReference = FirebaseDatabase.instance.ref("FeedBack");
  final user = FirebaseAuth.instance.currentUser;

  ///
  ///
  ///
  TextEditingController feedBackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FeedBackViewModel(),
      child: Consumer<FeedBackViewModel>(
        builder: (context, value, child) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                51.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: customtextformfeild(
                    controller: feedBackController,
                    text: "  Feed Back?",
                    obscureText: false,
                    maxline: 5,
                  ),
                ),
                30.verticalSpace,
                CustomloginButton(
                  loading: loading,
                  text: ' Submit ',
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });
                    if (feedBackController.text.isNotEmpty) {
                      Utils().ToastMessage("Thanks for your feedback");
                      print("feed back submitted ");
                      DatabaseReference.child(
                        DateTime.now().millisecondsSinceEpoch.toString(),
                      ).child("Comment").set(
                        {
                          'id':
                              DateTime.now().millisecondsSinceEpoch.toString(),
                          // tittle is key and feedback is value
                          'tittle': feedBackController.text.toString(),
                        },
                      ).then(
                        (value) {
                          setState(() {
                            loading = false;
                          });
                        },
                      );
                    } else {
                      setState(() {
                        loading = false;
                      });
                      print("form in empty");
                      Utils().ToastMessage("Please enter your feedback");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
