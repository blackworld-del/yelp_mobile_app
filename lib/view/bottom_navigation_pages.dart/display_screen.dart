import 'package:flutter/material.dart';
import 'package:yelp/constant/colors.dart';

class YelpDisplayScreen extends StatelessWidget {
  const YelpDisplayScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Display",
          style: TextStyle(
            color: YelpColors.backGroundColor,
          ),
        ),
      ),
    );
  }
}
