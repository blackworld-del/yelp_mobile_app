import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/utils/device_size.dart';
import 'package:yelp/view/auth/log_in.dart';
import 'package:yelp/view/auth/sign_up.dart';
import 'package:yelp/view/home/bottom_navigation_controller.dart';

import '../../constant/colors.dart';

class YelpStartedScreen extends StatelessWidget {
  const YelpStartedScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 13,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "asstes/svgs/logo.svg",
              width: deviceWidth(context: context) * 0.2,
              height: deviceHeight(context: context) * 0.15,
            ),
            SizedBox(
              height: deviceHeight(context: context) * 0.05,
            ),
            Text(
              "Discover Local Favorites",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: YelpColors.backGroundColor,
              ),
            ),
            SizedBox(
              height: deviceHeight(context: context) * 0.02,
            ),
            Text(
              "Find the Best Nearby Merchants with Ease",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: deviceHeight(context: context) * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return YelpLoginScreen();
                  }),
                  (route) => true,
                );
              },
              child: customButton(
                context: context,
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                backgroundColor: YelpColors.backGroundColor,
              ),
            ),
            SizedBox(
              height: deviceHeight(context: context) * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return YelSignUpScreen();
                  }),
                  (route) => true,
                );
              },
              child: customButton(
                context: context,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: YelpColors.backGroundColor,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: deviceHeight(context: context) * 0.02,
            ),
            const Center(
              child: Text(
                "By Continuing , your agree to our Privacy\nPolicy & Term Of Use",
                textAlign: TextAlign.center, // Align text to the center
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight(context: context) * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
