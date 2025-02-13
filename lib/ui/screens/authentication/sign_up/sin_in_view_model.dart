import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/screens/authentication/utils/sign_in_error_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  bool loading = false;
  final formKey = GlobalKey<FormState>();

  ///
  /// this step will give us API exposure of registration
  ///
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signIn() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        // setState(() {
        loading = false;
        notifyListeners();
        // });
      }).onError(
        (error, stackTrace) {
          Utils().ToastMessage(
            error.toString(),
          );
          // setState(() {
          loading = false;
          notifyListeners();
          // });
        },
      );
    } catch (e) {
      print("signIn Failed$e");
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  ///
  ///  for name
  ///
  String? validateName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Enter your name ';
    }
    return null;
  }

  ///
  /// for emial
  ///
  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return 'Enter your email';
    } else if (!emailRegex.hasMatch(value)) {
      return "enter valid email e.g abc@gmail.com";
    }
    return null;
  }

  ///
  /// for password
  ///
  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length < 6) {
      return 'Enter a valid password';
    }
    return null;
  }

  ///
  ///for confirm password
  ///
  String? validateConfirmPassword(value) {
    if (passwordController.text != confirmPasswordController.text) {
      return 'Confirm password is incorrect ';
    }
    return null;
  }

  ///
  ///  to store user data in firestore
  ///
  void uploadUserDataToFireStore() {
    // print user data for debugging

    final user = auth.currentUser;
    try {
      FirebaseFirestore.instance.collection("users").doc(user?.uid).set(
        {
          'id': user?.uid,
          'name': nameController.text.toString(),
          'email': emailController.text.toString(),
          'password': passwordController.text.toString(),
          // so on
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
