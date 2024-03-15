import 'package:flutter/material.dart';

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
    );
  }
}
