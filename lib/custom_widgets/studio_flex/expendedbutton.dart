import 'package:flutter/material.dart';

import 'package:code_structure/core/constants/colors.dart';

class CustomExpendButton extends StatefulWidget {
  final String text; // String for the button text
  // final Icon icon; // Icon for the button

  CustomExpendButton({
    required this.text, // Required text
  });

  @override
  State<CustomExpendButton> createState() => _CustomExpendButtonState();
}

class _CustomExpendButtonState extends State<CustomExpendButton> {
  bool isSelected = true;
  @override
  void initState() {
    super.initState();
  }

  void onClick() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:
            MainAxisAlignment.center, // Center content vertically
        children: [
          Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
              border: Border.all(width: 1.6, color: whiteColor),
              color: PrimarybuttonColor,
              // color: isSelected ? PrimarybuttonColor : SecondarybuttonColor,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  icon,
                  // SizedBox(width: 8),
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
