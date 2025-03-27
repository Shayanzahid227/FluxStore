import 'package:code_structure/custom_widgets/studio_flex/login_button.dart';
import 'package:code_structure/custom_widgets/studio_flex/text_feild.dart';
import 'package:code_structure/ui/screens/authentication/log/login_with_phone_number/login_phone_view_model.dart';
import 'package:code_structure/ui/screens/authentication/pin_code/pin_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginWithPhoneNumberScreen extends StatefulWidget {
  const LoginWithPhoneNumberScreen({super.key});

  @override
  State<LoginWithPhoneNumberScreen> createState() =>
      _LoginWithPhoneNumberScreenState();
}

class _LoginWithPhoneNumberScreenState
    extends State<LoginWithPhoneNumberScreen> {
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController PhoneNumberController = TextEditingController();
  String? validateWithPhoneNUmber(String? value) {
    if (value.toString().isEmpty) {
      return "phone number is mandatory";
    } else if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value!)) {
      return "Invalid phone number";
    } else {
      return null;
    }
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginWithPhoneNumberViewModel(),
      child: Consumer<LoginWithPhoneNumberViewModel>(
          builder: (context, model, child) => Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          50.verticalSpace,
                          customtextformfeild(
                              text: "+1 123 456 789",
                              obscureText: false,
                              controller: PhoneNumberController,
                              validator: validateWithPhoneNUmber),
                          60.verticalSpace,
                          CustomloginButton(
                            text: "send OTP",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PinCodeScreen(),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
