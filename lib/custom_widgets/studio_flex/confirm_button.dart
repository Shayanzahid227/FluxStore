import 'package:flutter/material.dart';

import 'package:code_structure/core/constants/colors.dart';

class CustomConfirmButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomConfirmButton(
      {super.key, required this.text, required this.onPressed});

  @override
  State<CustomConfirmButton> createState() => _CustomConfirmButtonState();
}

class _CustomConfirmButtonState extends State<CustomConfirmButton> {
  bool isSelected = true;

  @override
  void initState() {
    super.initState();
  }

// for button color
  void onClick() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  // for navigation
  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        onClick();
      }, // Call the onTap function passed during widget creation
      child: GestureDetector(
        onTap: () {
          toggleSelection(); // Change button state
          widget.onPressed(); // Trigger the onPressed callback
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            children: [
              Container(
                height: screenHeight * 0.07,
                width: screenWidth * 0.45,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: whiteColor),

                  ///
                  ///
                  ///   when button color is changing then navigation does't perform
                  ///
                  ///
                  ///
                  color: primaryConfirmButtonColor,
                  // color: isSelected ? Color(0xfff2d201c) : SecondarybuttonColor,
                  ///
                  ///
                  ///
                  borderRadius: BorderRadius.circular(40),
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
                          color: isSelected ? Colors.white : whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
