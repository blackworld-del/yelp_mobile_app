import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/common/input_fields.dart';
import 'package:yelp/constant/colors.dart';
import 'package:yelp/utils/device_size.dart';

class YelSignUpScreen extends StatelessWidget {
  YelSignUpScreen({
    super.key,
  });
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController rePasscontroller = TextEditingController();
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
                  obscureText: true,
                ),
                SizedBox(
                  height: deviceHeight(context: context) * 0.02,
                ),
                inputField(
                  hintText: "Re-Password",
                  controller: rePasscontroller,
                  obscureText: true,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {},
                  child: customButton(
                    context: context,
                    child: const Text("Create Account"),
                    backgroundColor: YelpColors.backGroundColor,
                  ),
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
