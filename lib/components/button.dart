// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:japanese_food/themes/colors.dart';
import 'package:japanese_food/themes/fonts.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  String text;
  double height;
  double width;
  Function onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: darkPinkColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: mediumWhiteText.copyWith(
                fontSize: 14,
              ),
            ),

            // * Space
            SizedBox(width: 12),

            // Icon
            Image.asset(
              "assets/icons/right_arrow.png",
              width: 16,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
