import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class customtextformfeild extends StatelessWidget {
  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const customtextformfeild(
      {required this.text,
      this.prefixIcon,
      this.suffixIcon,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(fontWeight: FontWeight.w300),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
// import 'package:code_structure/core/constants/colors.dart';
// import 'package:code_structure/core/constants/text_style.dart';
// import 'package:flutter/material.dart';

// class CustomTextFormField extends StatelessWidget {
//   final String text;
//   final Widget? prefixIcon; // Optional Prefix Icon
//   final Widget? suffixIcon; // Optional Suffix Icon

//   const CustomTextFormField({
//     required this.text,
//     this.prefixIcon, // Optional Prefix Icon
//     this.suffixIcon, // Optional Suffix Icon
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: text,
//         hintStyle: TextStyle(fontWeight: FontWeight.w300),
//         prefixIcon: prefixIcon, // Show prefix icon if provided
//         suffixIcon: suffixIcon, // Show suffix icon if provided
//       ),
//     );
//   }
// }
