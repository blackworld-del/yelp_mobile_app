import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/utils/device_size.dart';
import 'package:yelp/view/start/start_screen.dart';

import '../../constant/colors.dart';

class YelpSettingsScreen extends StatelessWidget {
  const YelpSettingsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.all(deviceWidth(context: context) * 0.12),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const YelpStartedScreen();
                  }), (route) => false);
                },
                child: customButton(
                  context: context,
                  child: const Text("Log out"),
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
