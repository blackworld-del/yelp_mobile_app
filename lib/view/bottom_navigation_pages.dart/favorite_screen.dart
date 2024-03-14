import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class YelpFavoriteScreen extends StatelessWidget {
  const YelpFavoriteScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favorite",
          style: TextStyle(
            color: YelpColors.backGroundColor,
          ),
        ),
      ),
    );
  }
}
