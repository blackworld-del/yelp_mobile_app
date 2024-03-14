import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/common/input_fields.dart';
import 'package:yelp/constant/colors.dart';
import 'package:yelp/utils/device_size.dart';
import 'package:yelp/view/auth/reset_pass.dart';

class YelpLoginScreen extends StatelessWidget {
  const YelpLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
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
              "Welcome Back",
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
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                customButton(
                  context: context,
                  child: const Text("Login"),
                  backgroundColor: YelpColors.backGroundColor,
                ),
                SizedBox(
                  height: deviceHeight(context: context) * 0.02,
                ),
                Text(
                  "Forget Password ?",
                  style: TextStyle(
                    fontSize: 13,
                    color: YelpColors.backGroundColor,
                  ),
                ),
                SizedBox(
                  height: deviceHeight(context: context) * 0.005,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const YelpResetScreen();
                      }),
                    );
                  },
                  child: Text(
                    "Reset Now",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: YelpColors.backGroundColor,
                    ),
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
