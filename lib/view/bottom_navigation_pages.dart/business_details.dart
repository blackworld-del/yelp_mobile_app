import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/constant/colors.dart';
import 'package:yelp/utils/device_size.dart';
import 'package:yelp/view/bottom_navigation_pages.dart/locations.dart';

class BusinessDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> business;

  const BusinessDetailsScreen({Key? key, required this.business})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: YelpColors.backGroundColor,
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_rounded,
                color: YelpColors.backGroundColor,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(deviceWidth(context: context) * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Set MainAxisAlignment.spaceBetween here
                children: [
                  Expanded(
                    flex: 1,
                    child: customButton(
                      context: context,
                      child: const Text("Add Review"),
                      backgroundColor: YelpColors.backGroundColor,
                    ),
                  ),
                  const SizedBox(
                      width:
                          20), // Add SizedBox to create space between buttons
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      child: customButton(
                        context: context,
                        child: const Text(
                          "Location",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
