import 'package:flutter/material.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/common/input_fields.dart';
import 'package:yelp/constant/colors.dart';
import 'package:yelp/utils/device_size.dart';

class YelSignUpScreen extends StatelessWidget {
  const YelSignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController rePasscontroller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: Text(
              "Welcome User",
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
                ),
                SizedBox(
                  height: deviceHeight(context: context) * 0.02,
                ),
                inputField(
                  hintText: "Password",
                  controller: passController,
                ),
                SizedBox(
                  height: deviceHeight(context: context) * 0.02,
                ),
                inputField(
                  hintText: "Re-Password",
                  controller: rePasscontroller,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                customButton(
                  context: context,
                  child: const Text("Create Account"),
                  backgroundColor: YelpColors.backGroundColor,
                ),
                SizedBox(
                  height: deviceHeight(context: context) * 0.02,
                ),
                Text(
                  "Already Have an Account ?",
                  style: TextStyle(
                    fontSize: 13,
                    color: YelpColors.backGroundColor,
                  ),
                ),
                SizedBox(
                  height: deviceHeight(context: context) * 0.005,
                ),
                Text(
                  "Log In Now",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: YelpColors.backGroundColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
