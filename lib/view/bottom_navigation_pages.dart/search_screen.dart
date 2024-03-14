import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp/common/buttons.dart';
import 'package:yelp/common/input_fields.dart';
import 'package:yelp/utils/device_size.dart';

import '../../constant/colors.dart';

class YelpSearchScreen extends StatelessWidget {
  const YelpSearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: inputField(
                    hintText: "Search ...",
                    controller: searchController,
                  ),
                ),
                SizedBox(
                  width: deviceWidth(context: context) * 0.02,
                ),
                Expanded(
                  flex: 1,
                  child: customButton(
                    context: context,
                    child: const Icon(
                      Icons.youtube_searched_for,
                    ),
                    backgroundColor: const Color.fromARGB(255, 18, 28, 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
