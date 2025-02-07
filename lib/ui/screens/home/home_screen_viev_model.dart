import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/screens/authentication/log/login_with_emial/login_screen.dart';
import 'package:code_structure/ui/screens/authentication/utils/sign_in_error_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final _auth = FirebaseAuth.instance;

  BuildContext get context => context;

  ///
  ///   sign out and delete account is differ
  ///
  void signOut() {
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
  }
}
