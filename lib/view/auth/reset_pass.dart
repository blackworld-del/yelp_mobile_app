import 'package:flutter/material.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/common/input_fields.dart';
import 'package:yelp/constant/colors.dart';
import 'package:yelp/utils/device_size.dart';

class YelpResetScreen extends StatelessWidget {
  YelpResetScreen({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: YelpColors.backGroundColor.withOpacity(0.4),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: Text(
              "Reset Your Password",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: YelpColors.backGroundColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(23.5),
            child: Column(
              children: [
                inputField(
                  hintText: "Email",
                  controller: emailController,
                  obscureText: true,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                customButton(
                  context: context,
                  child: const Text("Send Email"),
                  backgroundColor: YelpColors.backGroundColor,
                ),
                SizedBox(
                  height: deviceHeight(context: context) * 0.02,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
