import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/screens/authentication/utils/sign_in_error_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  bool loading = false;

  ///
  /// this step will give us API exposure of registration
  ///
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signIn() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
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

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  final RegExp _emailRegex = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  ///
  ///  for name
  ///
  String? _validateName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Enter your name ';
    }
    return null;
  }

  ///
  /// for emial
  ///
  String? _validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return 'Enter your email';
    } else if (!_emailRegex.hasMatch(value)) {
      return "enter valid email e.g abc@gmail.com";
    }
    return null;
  }

  ///
  /// for password
  ///
  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length < 6) {
      return 'Enter a valid password';
    }
    return null;
  }

  ///
  ///for confirm password
  ///
  String? _validateConfirmPassword(value) {
    if (_passwordController.text != _confirmPasswordController.text) {
      return 'Confirm password is incorrect ';
    }
    return null;
  }
}
