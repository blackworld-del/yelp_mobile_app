// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp/constant/colors.dart';

Widget inputField({
  required String hintText,
  required TextEditingController controller,
  bool obscureText = false,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(227, 238, 238, 238), // Grey background color
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
    ),
    padding: const EdgeInsets.symmetric(
        horizontal: 16.0), // Adjust padding as needed
    child: TextField(
      obscureText: obscureText,
      cursorColor: YelpColors.backGroundColor,
      style: TextStyle(
        color: YelpColors.backGroundColor,
        fontSize: 13,
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: YelpColors.backGroundColor.withOpacity(0.2),
          fontSize: 13,
        ), // Placeholder text
        border: InputBorder.none, // Remove border
      ),
    ),
  );
}
