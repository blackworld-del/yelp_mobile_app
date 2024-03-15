import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/common/input_fields.dart';
import 'package:yelp/constant/colors.dart';
import 'package:yelp/data/local/yelp_lcoal.dart';
import 'package:yelp/utils/device_size.dart';
import 'package:yelp/view/auth/reset_pass.dart';
import 'package:yelp/view/home/bottom_navigation_controller.dart';

class YelpLoginScreen extends StatelessWidget {
  YelpLoginScreen({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
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
                  obscureText: true,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (YelpLocalData.getUsername() == emailController.text &&
                        YelpLocalData.getPassword() == passController.text) {
                      YelpLocalData.userCardentials(
                              username: emailController.text,
                              password: passController.text)
                          .then((value) {
                        ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Login success",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return const YelpHomeController();
                        }), (route) => false);
                      });
                    } else {
                      ScaffoldMessenger.maybeOf(context)!
                          .showSnackBar(const SnackBar(
                        content: Text(
                          "please check your username or password",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: customButton(
                    context: context,
                    child: const Text("Login"),
                    backgroundColor: YelpColors.backGroundColor,
                  ),
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
                        return YelpResetScreen();
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
